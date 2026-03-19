function [ys, params, check] = TANKC_model0_steadystate(ys, exo, M_, options_)
%% Step 0
check = 0;
%% Step 1
for ii = 1:M_.param_nbr
    eval([ M_.param_names{ii} ' = M_.params(' int2str(ii) ');' ]);
end
%% Step 2
if P_lambda <= 0 || P_lambda >= 1 || P_psi <= 1 || P_beta <= 0 || P_beta >= 1
    check = 1; return
end
%% Step 3
flag0 = (numel(ys) == 21);
PI  = 1;
MC  = (1 + P_tau_s) * (1 - 1/P_psi);
R_N = 1 / P_beta;
R   = R_N;
m = 0; a = 0; c = 0; n = 0; d = 0; w = 0;
% KPR (P_gamma=1) のとき N_exp の (P_gamma-1) 項はゼロになる
N_exp = 1 + P_varphi + (1 - P_alpha) * (P_gamma - 1);
if abs(N_exp) < 1e-12; check = 1; return; end
N0    = ((1 - P_alpha) * MC)^(1 / N_exp);
if ~flag0
    N = N0;
    if N <= 0; check = 1; return; end
    Y   = N^(1 - P_alpha);
    C   = Y;
    W   = (1 - P_alpha) * MC * N^(-P_alpha);
    D   = Y * (1 - (1 - P_alpha) * MC);
    C_H = W * N + (P_tau_d / P_lambda) * D;
    C_S = (C - P_lambda * C_H) / (1 - P_lambda);
    if C_H <= 0 || C_S <= 0; check = 1; return; end
    if abs(P_gamma - 1) < 1e-10
        % KPR 極限 (γ→1): memo-KPR.qmd 参照
        MU_S = C_S^(-P_xi - 1) * exp(P_xi * N^(1 + P_varphi) / (1 + P_varphi));
    else
        inner = C_S^(1 - P_gamma) + (P_gamma - 1) * N^(1 + P_varphi) / (1 + P_varphi);
        if inner <= 0; check = 1; return; end
        MU_S = C_S^(-P_gamma) * inner^(-P_xi / (1 - P_gamma));
    end
    gap = log(C_S / C_H);
else
    W0  = (1 - P_alpha) * MC * N0^(-P_alpha);
    Y0  = N0^(1 - P_alpha);
    D0  = Y0 * (1 - (1 - P_alpha) * MC);
    CH0 = W0 * N0 + (P_tau_d / P_lambda) * D0;
    fopt = optimset('Display', 'off', 'TolX', 1e-14, 'TolFun', 1e-14, 'MaxIter', 2000, 'MaxFunEvals', 4000);
    [x, fval, exitflag] = fsolve(@(x) tankc0_res(x, MC, P_alpha, P_gamma, P_varphi, P_tau_d, P_lambda), [N0; CH0], fopt);
    if exitflag <= 0 || max(abs(fval)) > 1e-8; check = 1; return; end
    N   = x(1);
    C_H = x(2);
    W   = (1 - P_alpha) * MC * N^(-P_alpha);
    Y   = N^(1 - P_alpha);
    C   = Y;
    D   = Y * (1 - (1 - P_alpha) * MC);
    C_S = (C - P_lambda * C_H) / (1 - P_lambda);
    % 労働供給条件 W = C_i^P_gamma * N_i^P_varphi から N_i を逆算
    N_H = (W / C_H^P_gamma)^(1 / P_varphi);
    N_S = (W / C_S^P_gamma)^(1 / P_varphi);
    if C_H <= 0 || C_S <= 0 || N_H <= 0 || N_S <= 0; check = 1; return; end
    if abs(P_gamma - 1) < 1e-10
        % KPR 極限 (γ→1): memo-KPR.qmd 参照
        MU_S = C_S^(-P_xi - 1) * exp(P_xi * N_S^(1 + P_varphi) / (1 + P_varphi));
    else
        inner = C_S^(1 - P_gamma) + (P_gamma - 1) * N_S^(1 + P_varphi) / (1 + P_varphi);
        if inner <= 0; check = 1; return; end
        MU_S = C_S^(-P_gamma) * inner^(-P_xi / (1 - P_gamma));
    end
    gap = log(C_S / C_H);
end
%% Step 4
params = NaN(M_.param_nbr, 1);
for iter = 1:M_.param_nbr
    eval(['params(' num2str(iter) ') = ' M_.param_names{iter} ';']);
end
for ii = 1:M_.orig_endo_nbr
    eval(['ys(' int2str(ii) ') = ' M_.endo_names{ii} ';']);
end
end

function F = tankc0_res(x, MC, P_alpha, P_gamma, P_varphi, P_tau_d, P_lambda)
    N = x(1);  C_H = x(2);
    if N <= 0 || C_H <= 0; F = [1e10; 1e10]; return; end
    W   = (1 - P_alpha) * MC * N^(-P_alpha);
    Y   = N^(1 - P_alpha);
    D   = Y * (1 - (1 - P_alpha) * MC);
    C_S = (Y - P_lambda * C_H) / (1 - P_lambda);
    if C_S <= 0; F = [1e10; 1e10]; return; end
    N_H = (W / C_H^P_gamma)^(1 / P_varphi);
    N_S = (W / C_S^P_gamma)^(1 / P_varphi);
    F   = [C_H - W*N_H - (P_tau_d/P_lambda)*D;
           N   - P_lambda*N_H - (1-P_lambda)*N_S];
end
