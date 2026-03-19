// =========================================================================
// TANK Model 0 - Two-Agent New Keynesian Model without Capital
// 2つの家計タイプ: Saver (リカード型) と Hand-to-Mouth (流動性制約)
// =========================================================================

// マクロスイッチ
// FLAG=1: 代表的家計（N_H, N_S なし）  FLAG=0: 異質家計
// CRRA=1: CRRA 効用  KPR=1: King-Plosser-Rebelo 型効用
// ALPHA=1: 資本なし (P_alpha=0.3)  ALPHA=0: 労働のみ (P_alpha=0)
// PHI=1: P_tau_s=0  PHI=0: P_tau_s が利潤ゼロ水準に設定
@#define CRRA  = 0
@#define KPR   = 0

// -------------------------------------------------------------------------
// 変数宣言
// -------------------------------------------------------------------------
@#if FLAG==1
  var C C_H C_S N D W MC MU_S Y R_N R PI m a c n d w gap;
@#else
  var C C_H C_S N N_H N_S D W MC MU_S Y R_N R PI m a c n d w gap;
@#endif

varexo eps_a eps_m;

parameters P_beta P_gamma P_varphi P_xi P_phi
           P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

// -------------------------------------------------------------------------
// パラメータ設定
// -------------------------------------------------------------------------
P_beta   = 0.95;   // 割引因子
P_varphi = 2.0;    // 労働の逆フリッシュ弾力性
P_eta    = 1.0;    // 価格調整コスト
P_psi    = 5.0;    // マークアップ弾力性
P_lambda = 0.25;   // Hand-to-Mouth 家計のシェア
P_tau_d  = 0.2;    // 配当税率
P_phi    = 1.5;    // テイラー・ルールのインフレ係数
P_rho_a  = 0.9;    // 技術ショック持続性
P_rho_m  = 0.8;    // 金融政策ショック持続性

@#if CRRA==1
  P_xi    = 0;     // CRRA: 労働分離型
@#else
  P_xi    = 0.5;   // GHH: 消費・労働の補完性
@#endif

@#if KPR==1
  P_gamma = 1.0;   // KPR: 消費曲率 = 1
@#else
  P_gamma = 2.0;   // 消費曲率
@#endif

@#if ALPHA==1
  P_alpha = 0.3;   // 資本あり近似（労働シェア 0.3）
@#else
  P_alpha = 0.0;   // 資本なし（線形生産）
@#endif

@#if PHI==1
  P_tau_s = 0.0;                    // 売上税ゼロ
@#else
  P_tau_s = 1 / (1 - 1/P_psi) - 1; // 利潤ゼロとなる売上税率
@#endif

// =========================================================================
model;
// =========================================================================

// -------------------------------------------------------------------------
// Hand-to-Mouth 家計 (H): 予算制約・労働供給
// -------------------------------------------------------------------------
@#if FLAG==1
  C_H = W * N + (P_tau_d / P_lambda) * D;
  W   = C^P_gamma * N^P_varphi;
@#else
  C_H = W * N_H + (P_tau_d / P_lambda) * D;
  W   = C_H^P_gamma * N_H^P_varphi;
  W   = C_S^P_gamma * N_S^P_varphi;
  N   = P_lambda * N_H + (1 - P_lambda) * N_S;
@#endif

// -------------------------------------------------------------------------
// Saver 家計 (S): 限界効用・オイラー方程式
// -------------------------------------------------------------------------
@#if CRRA==1
  MU_S = C_S^(-P_gamma);
@#else
  @#if FLAG==1
    @#if KPR==1
      MU_S = C_S^(-P_xi-1) * exp(P_xi * N^(1+P_varphi) / (1+P_varphi));
    @#else
      MU_S = C_S^(-P_gamma)
           * (C_S^(1-P_gamma) + (P_gamma-1) * N^(1+P_varphi) / (1+P_varphi))^(-P_xi/(1-P_gamma));
    @#endif
  @#else
    @#if KPR==1
      MU_S = C_S^(-P_xi-1) * exp(P_xi * N_S^(1+P_varphi) / (1+P_varphi));
    @#else
      MU_S = C_S^(-P_gamma)
           * (C_S^(1-P_gamma) + (P_gamma-1) * N_S^(1+P_varphi) / (1+P_varphi))^(-P_xi/(1-P_gamma));
    @#endif
  @#endif
@#endif

// オイラー方程式
1 = P_beta * (MU_S(+1) / MU_S) * R_N / PI(+1);

// -------------------------------------------------------------------------
// 企業: 限界費用・配当・フィリップス曲線
// -------------------------------------------------------------------------
W = (1 - P_alpha) * MC * exp(a) * N^(-P_alpha);
D = Y - 0.5 * P_eta * (PI - 1)^2 * Y - W * N;
P_eta * (PI - 1) * PI = P_psi * (MC - (1 + P_tau_s) * (1 - 1/P_psi))
    + P_beta * P_eta * (MU_S(+1) / MU_S) * (Y(+1) / Y) * (PI(+1) - 1) * PI(+1);

// -------------------------------------------------------------------------
// 金融政策（テイラー・ルール）
// -------------------------------------------------------------------------
R_N = exp(-m) * (1 / P_beta) * (PI^P_phi);
R   = R_N / PI(+1);

// -------------------------------------------------------------------------
// 集計・市場均衡
// -------------------------------------------------------------------------
C = P_lambda * C_H + (1 - P_lambda) * C_S;
Y = exp(a) * N^(1 - P_alpha);
Y = C;

// -------------------------------------------------------------------------
// ショック過程
// -------------------------------------------------------------------------
a = P_rho_a * a(-1) + eps_a;
m = P_rho_m * m(-1) + eps_m;

// -------------------------------------------------------------------------
// 補助変数: 定常状態からの対数偏差
// -------------------------------------------------------------------------
c   = log(C / steady_state(C));
n   = log(N / steady_state(N));
w   = log(W / steady_state(W));
d   = (D - steady_state(D)) / steady_state(Y);
gap = log(C_S / C_H);

end;

// =========================================================================
// 外生ショック
// =========================================================================
shocks;
  var eps_a = 0.01;   // 技術ショック分散
  var eps_m = 0.01;   // 金融政策ショック分散
end;

// =========================================================================
// 初期値（Newton ソルバーの出発点）
// 均衡条件を順番に解いて近似値を与える
// =========================================================================
/*initval;
//steady_state_model;
  PI  = 1;
  MC  = (1 + P_tau_s) * (1 - 1/P_psi);
  R_N = 1 / P_beta;
  R   = 1 / P_beta;
  N   = ((1 - P_alpha) * MC)^(1 / (1 + P_varphi + (1 - P_alpha)*(P_gamma-1)));
  Y   = N^(1 - P_alpha);
  C   = Y;
  W   = (1 - P_alpha) * MC * N^(-P_alpha);
  D   = Y * (1 - (1 - P_alpha) * MC);
  // C_H: Hand-to-Mouth 予算制約（FLAG=1 のとき N_H = N）
  C_H = W * N + (P_tau_d / P_lambda) * D;
  C_S = (C - P_lambda * C_H) / (1 - P_lambda);
  @#if FLAG==0
    // 労働供給条件 W = C_i^gamma * N_i^varphi から N_i を逆算
    N_H = (W / C_H^P_gamma)^(1 / P_varphi);
    N_S = (W / C_S^P_gamma)^(1 / P_varphi);
  @#endif
  @#if CRRA==1
    MU_S = C_S^(-P_gamma);
  @#else
    @#if FLAG==1
        @#if KPR==1
            MU_S = C_S^(-P_xi-1) * exp(P_xi * N^(1+P_varphi) / (1+P_varphi));
        @#else  
            MU_S = C_S^(-P_gamma)
                 * (C_S^(1-P_gamma) + (P_gamma-1) * N^(1+P_varphi) / (1+P_varphi))^(-P_xi/(1-P_gamma));
        @#endif
    @#else
        @#if KPR==1
            MU_S = C_S^(-P_xi-1) * exp(P_xi * N_S^(1+P_varphi) / (1+P_varphi));
        @#else
            MU_S = C_S^(-P_gamma)
                 * (C_S^(1-P_gamma) + (P_gamma-1) * N_S^(1+P_varphi) / (1+P_varphi))^(-P_xi/(1-P_gamma));
        @#endif
    @#endif
  @#endif
  // 定常状態では対数偏差変数はゼロ
  m   = 0;
  a   = 0;
  c   = 0;
  n   = 0;
  d   = 0;
  w   = 0;
  gap = log(C_S / C_H);
end;*/
// =========================================================================
// 計算
// =========================================================================
steady;
verbatim;
  [oo_.steady_state, M_.params, info] = TANKC_model0_steadystate(oo_.steady_state, oo_.exo_steady_state, M_, options_);
  if info
    error('TANKC_model0_steadystate failed to compute a valid steady state.');
  end
  for i = 1:M_.param_nbr
    eval([M_.param_names{i} ' = M_.params(' int2str(i) ');']);
  end
  for i = 1:M_.orig_endo_nbr
    eval([M_.endo_names{i} ' = oo_.steady_state(' int2str(i) ');']);
  end
end;
resid;
check;

save_params_and_steady_state('TANKC_model0_steady.txt');

//stoch_simul(order=1, irf=20) c n d w gap;