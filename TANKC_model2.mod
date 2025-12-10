// TANK Model 2 - linearized around steady state from TANK_model1
//
// 使い方:
// 1. まず TANK_model1.mod を実行し TANK_model1_steady.txt を生成
// 2. 続けて本ファイルを実行（linearlized TANKC）


//----------------------
// 変数とショック
//----------------------
var d w n n_H n_S mc mu_S c c_H c_S y r_N r pi m a;
varexo eps_a eps_m;

//----------------------
// パラメータ（元パラメータ）
//----------------------
parameters P_beta P_gamma_0 P_gamma P_varphi P_xi P_kappa P_phi
           P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

// 定常状態をパラメータとして保持（TANK_model1 から読込）
parameters W N N_H N_S MC C C_H C_S Y D;

// 保存済みのパラメータと定常値を読み込む
load_params_and_steady_state('TANKC_model1_steady.txt');

// 均衡での κ を固定（価格調整コストの線形近似値）
P_kappa = P_xi /
    (1 - (1 - P_alpha) * MC * (1 - P_gamma) / (1 + P_varphi) * ((N_S / N) / (C_S / C)));

model(linear);

//----------------------
// Hand-to-mouth household (H)
//----------------------
// 効率賃金（シーソー条件）
w = P_gamma * c_H + P_varphi * n_H;
// 予算制約（賃金所得＋配当の取り分）
(C_H / Y) * c_H = (W * N_H / Y) * (w + n_H) + (P_tau_d / P_lambda) * d;

//----------------------
// Saver household (S)
//----------------------
// 効率賃金（労働供給条件）
w = P_gamma * c_S + P_varphi * n_S;
// オイラー方程式（実質金利 = 期待インフレ＋効用差分）
r_N = pi(+1) + mu_S - mu_S(+1);
// 限界効用（労働 disutility と賃金スプレッド）
mu_S = - (P_gamma + P_kappa) * c_S
    + P_kappa * (1 - P_alpha) * MC * ((N_S / N) / (C_S / Y)) * n_S;

//----------------------
// Firms
//----------------------
// リアルマージン = 賃金 - 生産性 + αn
w = mc + a - P_alpha * n;
// 利潤配当（線形化）
d = (P_alpha - 1) * MC * mc - (1 + (P_alpha - 1) * MC) * y;

//----------------------
// New Keynesian Phillips Curve
//----------------------
pi = P_beta * pi(+1) + P_psi * (MC / P_eta) * mc;

//----------------------
// Monetary policy (Taylor rule)
//----------------------
r_N = P_phi * pi - m;
r = r_N - pi(+1);

//----------------------
// Aggregation and resource constraints
//----------------------
c = P_lambda * (C_H / C) * c_H + (1 - P_lambda) * (C_S / C) * c_S;
n = P_lambda * (N_H / N) * n_H + (1 - P_lambda) * (N_S / N) * n_S;
y = a + (1 - P_alpha) * n;   // 線形化された生産関数
y = c;                        // 閉鎖条件（財市場均衡）

//----------------------
// Shock processes
//----------------------
a = P_rho_a * a(-1) + eps_a;  // TFP shock
m = P_rho_m * m(-1) + eps_m;  // Monetary policy shock

end;

shocks;
var eps_a = 0.01;    // 選好ショック分散
var eps_m = 0.01;    // 金融政策ショック分散
end;

steady;
check;

stoch_simul(order=1, irf=20) c n d w;