clear all

% dynare TANKC_model1.mod -DFLAG=1

% dynare TANKC_model2.mod -DFLAG=1 -DLUMPSUM=0
% %y10  = oo_.irfs.c_S_eps_m-oo_.irfs.c_H_eps_m;
% y  = oo_.irfs.y_eps_m;


% t=1:20;


% figure;
% plot(t,y_a, t,y, 'LineWidth', 2)
% pause;
% close all


P_gamma   = 2.0;        
P_varphi  = 1.0;        
P_xi      = 0.5;      
P_lambda  = 0.2;      
P_alpha   = 0.3;      
%P_alpha   = 0.;      

P_phi = 5;
P_tau_s = 1/(1-1/P_psi)-1; 
%P_tau_s   = 0.0;        
P_tau_d   = 0.1;        

MC = (1-1/P_psi)*(1+P_tau_s);
C =((1-P_alpha)*MC)^((1-P_alpha)/((1-P_alpha)*P_gamma+P_varphi));
C_H = C * ((P_lambda - P_tau_d)*(1-P_alpha)*MC+P_tau_d) / P_lambda;
C_S = C * (1- P_tau_d - (P_lambda - P_tau_d)*(1-P_alpha)*MC) / (1-P_lambda);

P_kappa = P_xi /(1 - (1 - P_alpha) * MC * (1 - P_gamma) / (1 + P_varphi) * (C / C_S));


set_param_value('P_alpha', P_alpha);
set_param_value('P_tau_s', P_tau_s);
set_param_value('MC', MC);
set_param_value('C', C);
set_param_value('C_H', C_H);
set_param_value('C_S', C_S);
set_param_value('P_kappa', P_kappa);

[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_); 
y_b  = oo_.irfs.c_eps_m;

P_alpha   = 0.; 
P_tau_s = 0.0; 
MC = (1-1/P_psi)*(1+P_tau_s);
C =((1-P_alpha)*MC)^((1-P_alpha)/((1-P_alpha)*P_gamma+P_varphi));
C_H = C * ((P_lambda - P_tau_d)*(1-P_alpha)*MC+P_tau_d) / P_lambda;
C_S = C * (1- P_tau_d - (P_lambda - P_tau_d)*(1-P_alpha)*MC) / (1-P_lambda);

P_kappa = P_xi /(1 - (1 - P_alpha) * MC * (1 - P_gamma) / (1 + P_varphi) * (C / C_S));


set_param_value('P_alpha', P_alpha);
set_param_value('P_tau_s', P_tau_s);
set_param_value('MC', MC);
set_param_value('C', C);
set_param_value('C_H', C_H);
set_param_value('C_S', C_S);
set_param_value('P_kappa', P_kappa);

[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_); 
y_c  = oo_.irfs.c_eps_m;

P_alpha   = 0.3; 
MC = (1-1/P_psi)*(1+P_tau_s);
C =((1-P_alpha)*MC)^((1-P_alpha)/((1-P_alpha)*P_gamma+P_varphi));
C_H = C * ((P_lambda - P_tau_d)*(1-P_alpha)*MC+P_tau_d) / P_lambda;
C_S = C * (1- P_tau_d - (P_lambda - P_tau_d)*(1-P_alpha)*MC) / (1-P_lambda);

P_kappa = P_xi /(1 - (1 - P_alpha) * MC * (1 - P_gamma) / (1 + P_varphi) * (C / C_S));


set_param_value('P_alpha', P_alpha);
set_param_value('P_tau_s', P_tau_s);
set_param_value('MC', MC);
set_param_value('C', C);
set_param_value('C_H', C_H);
set_param_value('C_S', C_S);
set_param_value('P_kappa', P_kappa);

[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_); 
y_d  = oo_.irfs.c_eps_m;




% 比較用の簡単な差分チェック
t=1:20;

close all

figure;
plot(t,y_a, t,y_b, t,y_c, t,y_d, 'LineWidth', 2)
legend('alpha=0.0 & Psi=0.0','alpha=0.3 & Psi=0.0','alpha=0.0 & Psi=0.2','alpha=0.3 & Psi=0.2')
title('model comparison')
xlabel('period')
ylabel('deviation')


