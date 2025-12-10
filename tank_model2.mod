// TANK Model 2 - Uses steady state values from TANK_model1 as parameters
// 
// 使い方:
// 1. まず TANK_model1.mod を実行して TANK_model1_steady.txt を生成
// 2. その後 tank_model2.mod を実行

var d w n n_H n_S mc c c_H c_S y r_N r pi m a c n d w;
varexo eps_a eps_m;

// 元のパラメータ
parameters P_beta P_gamma_0 P_gamma_c P_gamma_n P_phi
          P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

// 定常状態の値をパラメータとして追加（initvalやmodelで使用可能）
parameters D_ss W_ss N_ss N_H_ss N_S_ss MC_ss C_ss C_H_ss C_S_ss Y_ss R_N_ss R_ss PI_ss;

// 保存済みのパラメータと定常値を読み込む
// このコマンドは TANK_model1_steady.txt から全ての値を読み込む
// ファイル内の変数名がparametersで宣言されていれば自動的に設定される
load_params_and_steady_state('TANK_model1_steady.txt');

model(linear);
% Hand-to-mouth household wage-consumption condition and budget
w = P_gamma_c * c_H + P_gamma_n * n_H;
c_H = w + n_H + (P_tau_d/P_lambda)*d;

% Saver household wage condition and Euler equation
w = P_gamma_c * c_S + P_gamma_n * n_S;
r_N = pi(+1) + P_gamma_c*(c_S(+1)-c_S); 
% Marginal cost from firm side
w = (1-P_alpha)*mc + a + (-P_alpha)*n;

% Profits and resource constraint with price adjustment cost
d = (P_alpha -1) * MC_ss * mc - (1 + (P_alpha - 1) * MC_ss) * y;
% New Keynesian Phillips curve
pi = P_beta*pi(+1) + P_psi * MC_ss/P_eta * mc;
% Monetary policy (Taylor rule)
r_N = P_phi*pi - m;
r = r_N - pi(+1);

% Aggregation
c= P_lambda*c_H + (1-P_lambda)*c_S;
n= P_lambda*n_H + (1-P_lambda)*n_S;
y = a+ (1-P_alpha)*n;
y = c;

% Shock processes
a = P_rho_a * a(-1) + eps_a;
m = P_rho_m * m(-1) + eps_m;
end;

shocks;
var eps_a = 1;         % Preference shock variance
var eps_m = 1;       % Monetary policy shock variance
end;

steady;
check;

stoch_simul(order=1, irf=20) c n d w;