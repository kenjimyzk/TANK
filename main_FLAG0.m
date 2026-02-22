clear all

dynare TANKC_model1.mod -DFLAG=0 
dynare TANKC_model2_mini.mod -DFLAG=0

oo_.dr.order_var
oo_.dr.ghu

P_gamma = get_param_by_name('P_gamma');
P_varphi = get_param_by_name('P_varphi');
P_kappa = get_param_by_name('P_kappa');
P_lambda = get_param_by_name('P_lambda');
P_alpha = get_param_by_name('P_alpha');
P_tau_d = get_param_by_name('P_tau_d');
MC = get_param_by_name('MC');

check_val =(1-MC)*(P_varphi + 1)/(P_varphi + MC * (1-P_alpha) * P_gamma);
tilde_varphi = P_varphi*(1-P_tau_d/P_lambda)*(1-check_val);
tilde_gamma = P_gamma*(1-P_tau_d/P_lambda)*(1-check_val);

coef_c_H = 1+tilde_varphi;
coef_c_S = 1-tilde_varphi*P_lambda/(1-P_lambda);

coef_n_H = 1/(1-P_alpha)-tilde_gamma;
coef_n_S =(1/(1-P_alpha)+tilde_gamma*P_lambda/(1-P_lambda));

coef_mu_S = -(P_gamma+P_kappa) * coef_c_S+ P_kappa * (1-P_alpha) * MC * coef_n_S;

[oo_.dr.ghu(8), coef_c_H]
[oo_.dr.ghu(9), coef_c_S]
[oo_.dr.ghu(4), coef_n_H]
[oo_.dr.ghu(5), coef_n_S]
[oo_.dr.ghu(6), coef_mu_S]
