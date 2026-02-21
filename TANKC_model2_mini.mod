// TANK Model 2 - linearized around steady state from TANK_model1
//
// 使い方:
// 1. まず TANK_model1.mod を実行し TANK_model1_steady.txt を生成
// 2. 続けて本ファイルを実行（linearlized TANKC）


//----------------------
// 変数とショック
//----------------------

var d w n n_H n_S mu_S c c_H c_S, y;
varexo eps_a;

//----------------------
// パラメータ（元パラメータ）
//----------------------
parameters P_beta P_gamma_0 P_gamma P_varphi P_xi P_kappa P_phi
           P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

// 定常状態をパラメータとして保持（TANK_model1 から読込）
parameters W N N_H N_S MC C C_H C_S Y D;

// 保存済みのパラメータと定常値を読み込む
load_params_and_steady_state('TANKC_model1_steady.txt');
N_H=N;
N_S=N;
C_H=C;
C_S=C;

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
(C_H / C) * c_H = (1-P_alpha) * MC * N_H / N * (w + n_H) + (P_tau_d / P_lambda) * d;

//----------------------
// Saver household (S)
//----------------------
// 効率賃金（労働供給条件）
w = P_gamma * c_S + P_varphi * n_S;
// 限界効用（労働 disutility と賃金スプレッド）
mu_S = - (P_gamma + P_kappa) * c_S
    + P_kappa * (1 - P_alpha) * MC * ((N_S / N) / (C_S / Y)) * n_S;

//----------------------
// Firms
//----------------------
// 利潤配当（線形化）
d = (1 - MC) * y + (P_alpha - 1) * MC * w;

//----------------------
// Aggregation and resource constraints
//----------------------
c = P_lambda * (C_H / C) * c_H + (1 - P_lambda) * (C_S / C) * c_S;
n = P_lambda * (N_H / N) * n_H + (1 - P_lambda) * (N_S / N) * n_S;
y = (1 - P_alpha) * n;
y = c;                        // 閉鎖条件（財市場均衡）
y = P_rho_a * y(-1) + eps_a;     // 選好ショックの AR(1) プロセス
end;

shocks;
var eps_a = 1;    // 選好ショック分散
end;

steady;
check;

stoch_simul(order=1, irf=20, nograph) c_S c_H n_S n_H mu_S;