// TANK Model 2 - Linear version using steady state from TANK_model1
// 
// 使い方:
// 1. まず TANK_model1.mod を実行して TANK_model1_steady.txt を生成
// 2. その後 tank_model2.mod を実行


var d w n n_H n_S mc mu_S c c_H c_S y r_N r pi m a;
varexo eps_a eps_m;

// 元のパラメータ
parameters P_beta P_gamma_0 P_gamma P_varphi P_xi P_kappa P_phi
           P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

// 定常状態の値をパラメータとして追加
parameters W N N_H N_S MC C C_H C_S Y D;

// 保存済みのパラメータと定常値を読み込む
load_params_and_steady_state('TANKC_model1_steady.txt');

P_kappa = P_xi /  (
    1 - (1-P_alpha) * MC * (1-P_gamma)/(1+P_varphi) * ((N_S/N)/(C_S/C)));

model(linear);

// Hand-to-mouth household
// 賃金条件: w = P_gamma * c_H + P_varphi * n_H
w = P_gamma * c_H + P_varphi * n_H;
// 予算制約: c_H = w + n_H + (P_tau_d/P_lambda)*d
(C_H / Y) * c_H = (W * N_H / Y) * (w + n_H) + (P_tau_d/P_lambda) * d;

// Saver household
// 賃金条件
w = P_gamma * c_S + P_varphi * n_S;
// オイラー方程式
r_N = pi(+1) + mu_S - mu_S(+1);
// 限界効用　
mu_S = - (P_gamma + P_kappa) * c_S
     + P_kappa * (1-P_alpha) * MC * ((N_S/N)/(C_S/Y)) * n_S;

// 企業
// 限界費用
w = mc + a - P_alpha * n;
// 配当
d = (P_alpha - 1) * MC * mc - (1 + (P_alpha - 1) * MC) * y;

// ニューケインジアン・フィリップス曲線
pi = P_beta * pi(+1) + P_psi * (MC / P_eta) * mc;

// 金融政策（テイラー・ルール）
r_N = P_phi * pi - m;
r = r_N - pi(+1);

// 集計
c = P_lambda *  (C_H / C)* c_H + (1 - P_lambda) * (C_S / C) * c_S;
n = P_lambda * (N_H / N) * n_H + (1 - P_lambda) * (N_S / N) * n_S;
y = a + (1 - P_alpha) * n;
y = c;

// ショック過程
a = P_rho_a * a(-1) + eps_a;
m = P_rho_m * m(-1) + eps_m;

end;

shocks;
var eps_a = 0.01;    // 選好ショック分散
var eps_m = 0.01;    // 金融政策ショック分散
end;

steady;
check;

stoch_simul(order=1, irf=20) c n d w;