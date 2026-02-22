clear all

dynare TANKC_model1.mod -DFLAG=1 
dynare TANKC_model2_mini.mod -DFLAG=1

oo_.dr.order_var
oo_.dr.ghu

P_gamma = get_param_by_name('P_gamma');
P_varphi = get_param_by_name('P_varphi');
P_kappa = get_param_by_name('P_kappa');
P_lambda = get_param_by_name('P_lambda');
P_alpha = get_param_by_name('P_alpha');
P_tau_d = get_param_by_name('P_tau_d');
MC = get_param_by_name('MC');

check_val =(MC-1)+ MC *(P_varphi + (1-P_alpha) * P_gamma);
coef_c_H = 1+(1-P_tau_d/P_lambda) *check_val;
coef_c_S = (1-coef_c_H*P_lambda)/(1-P_lambda);

coef_mu_S = -(P_gamma+P_kappa) * coef_c_S+ P_kappa * (1-P_alpha) * MC;

[oo_.dr.ghu(6), coef_c_H]
[oo_.dr.ghu(7), coef_c_S]
[oo_.dr.ghu(4), coef_mu_S]
