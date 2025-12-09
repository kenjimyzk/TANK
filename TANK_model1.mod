var D, W, N, N_H, N_S, MC, C, C_H, C_S, Y, R_N, R, PI, m , a, c, n, d, w;
varexo eps_a eps_m;

parameters P_beta P_gamma_0 P_gamma_c P_gamma_n P_phi
P_psi P_eta P_tau_s P_tau_d P_lambda P_alpha P_rho_a P_rho_m;

% Household parameters
P_beta = 0.95;          % Discount factor (Saver)
P_gamma_0 = 1.0;        % Disutility of labor level term
P_gamma_c = 1.0;        % Curvature on consumption in utility
P_gamma_n = 1.0;        % Frisch elasticity inverse on labor
P_alpha = 0.3;          % Labor share in production (1-alpha is capital share here zero-capital case)
P_eta = 1.0;            % Price adjustment cost scale
P_psi = 5.0;            % Desired gross markup elasticity (Calvo-style)
P_lambda = 0.25;        % Share of Hand-to-Mouth households
P_tau_s = 1/(1-1/P_psi)-1; % Sales tax rate ensuring zero steady-state subsidy
%P_tau_s = 0.0;         % Alternative: zero sales tax
P_tau_d = 0.0;          % Dividend tax rate

% Policy parameters
P_phi = 1.5;            % Taylor rule inflation coefficient

% Shock persistence
P_rho_a = 0.9;          % Preference shock persistence
P_rho_m = 0.8;          % Monetary policy shock persistence

model;
% Hand-to-mouth household wage-consumption condition and budget
W = C_H^P_gamma_c * N_H^P_gamma_n;
C_H = W * N_H + (P_tau_d/P_lambda)*D;

% Saver household wage condition and Euler equation
W = C_S^P_gamma_c * N_S^P_gamma_n;
1 = P_beta*(C_S(+1)/C_S)^(-P_gamma_c)*R_N/PI(+1);

% Marginal cost from firm side
W = (1-P_alpha)*MC * exp(a) * N^(-P_alpha);

% Profits and resource constraint with price adjustment cost
D = Y - 0.5 * P_eta * (PI-1)^2 * Y - W*N;
% New Keynesian Phillips curve
P_eta*(PI-1)*PI = P_psi*(MC - (1+P_tau_s)*(1-1/P_psi))
    + P_beta*P_eta*(C_S(+1)/C_S)^(-P_gamma_c)*(Y(+1)/Y)*(PI(+1)-1)*PI(+1);

% Monetary policy (Taylor rule)
R_N = exp(-m)*(1/P_beta)*(PI^P_phi);
R = R_N/PI(+1);

% Aggregation
C= P_lambda*C_H + (1-P_lambda)*C_S;
N= P_lambda*N_H + (1-P_lambda)*N_S;
Y = exp(a) * N^(1-P_alpha);
Y = C;

% Shock processes
a = P_rho_a * a(-1) + eps_a;
m = P_rho_m * m(-1) + eps_m;

% Aux variables: log deviations from steady state
c = log(C/steady_state(C));
n = log(N/steady_state(N));
w = log(W/steady_state(W));
d = D/steady_state(Y);
end;


initval;
D=0;
W=1;
N=1;
N_H=1;
N_S=1;
C = 1;
C_H=1;
C_S=1;
MC = (1+P_tau_s)*(1-1/P_psi);
Y=1;
R_N=1;
R=1;
PI=1;
m = 0;
a = 0;
end;

shocks;
var eps_a = 0.01;         % Preference shock variance
var eps_m = 0.01;       % Monetary policy shock variance
end;

steady;
check;

% Save parameters and steady state to a .mat file
save_params_and_steady_state('TANK_model1_steady.mat');

stoch_simul(order=1, irf=20) c n d w;