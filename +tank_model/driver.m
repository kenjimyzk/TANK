%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'tank_model';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'eps_a'};
M_.exo_names_tex(1) = {'eps\_a'};
M_.exo_names_long(1) = {'eps_a'};
M_.exo_names(2) = {'eps_i'};
M_.exo_names_tex(2) = {'eps\_i'};
M_.exo_names_long(2) = {'eps_i'};
M_.exo_names(3) = {'eps_u'};
M_.exo_names_tex(3) = {'eps\_u'};
M_.exo_names_long(3) = {'eps_u'};
M_.endo_names = cell(9,1);
M_.endo_names_tex = cell(9,1);
M_.endo_names_long = cell(9,1);
M_.endo_names(1) = {'c_s'};
M_.endo_names_tex(1) = {'c\_s'};
M_.endo_names_long(1) = {'c_s'};
M_.endo_names(2) = {'c_h'};
M_.endo_names_tex(2) = {'c\_h'};
M_.endo_names_long(2) = {'c_h'};
M_.endo_names(3) = {'w'};
M_.endo_names_tex(3) = {'w'};
M_.endo_names_long(3) = {'w'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'y'};
M_.endo_names(5) = {'pi'};
M_.endo_names_tex(5) = {'pi'};
M_.endo_names_long(5) = {'pi'};
M_.endo_names(6) = {'i'};
M_.endo_names_tex(6) = {'i'};
M_.endo_names_long(6) = {'i'};
M_.endo_names(7) = {'a'};
M_.endo_names_tex(7) = {'a'};
M_.endo_names_long(7) = {'a'};
M_.endo_names(8) = {'u'};
M_.endo_names_tex(8) = {'u'};
M_.endo_names_long(8) = {'u'};
M_.endo_names(9) = {'n'};
M_.endo_names_tex(9) = {'n'};
M_.endo_names_long(9) = {'n'};
M_.endo_partitions = struct();
M_.param_names = cell(11,1);
M_.param_names_tex = cell(11,1);
M_.param_names_long = cell(11,1);
M_.param_names(1) = {'beta_s'};
M_.param_names_tex(1) = {'beta\_s'};
M_.param_names_long(1) = {'beta_s'};
M_.param_names(2) = {'beta_h'};
M_.param_names_tex(2) = {'beta\_h'};
M_.param_names_long(2) = {'beta_h'};
M_.param_names(3) = {'sigma'};
M_.param_names_tex(3) = {'sigma'};
M_.param_names_long(3) = {'sigma'};
M_.param_names(4) = {'gamma'};
M_.param_names_tex(4) = {'gamma'};
M_.param_names_long(4) = {'gamma'};
M_.param_names(5) = {'theta'};
M_.param_names_tex(5) = {'theta'};
M_.param_names_long(5) = {'theta'};
M_.param_names(6) = {'phi_pi'};
M_.param_names_tex(6) = {'phi\_pi'};
M_.param_names_long(6) = {'phi_pi'};
M_.param_names(7) = {'phi_y'};
M_.param_names_tex(7) = {'phi\_y'};
M_.param_names_long(7) = {'phi_y'};
M_.param_names(8) = {'rho_a'};
M_.param_names_tex(8) = {'rho\_a'};
M_.param_names_long(8) = {'rho_a'};
M_.param_names(9) = {'rho_i'};
M_.param_names_tex(9) = {'rho\_i'};
M_.param_names_long(9) = {'rho_i'};
M_.param_names(10) = {'rho_u'};
M_.param_names_tex(10) = {'rho\_u'};
M_.param_names_long(10) = {'rho_u'};
M_.param_names(11) = {'lambda_h'};
M_.param_names_tex(11) = {'lambda\_h'};
M_.param_names_long(11) = {'lambda_h'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 9;
M_.param_nbr = 11;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 9;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 12;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 13;
 0 8 0;
 1 9 0;
 2 10 0;
 0 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [1; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'c_s' ;
  2 , 'name' , 'c_h' ;
  3 , 'name' , 'y' ;
  4 , 'name' , 'n' ;
  5 , 'name' , 'w' ;
  6 , 'name' , 'pi' ;
  7 , 'name' , 'i' ;
  8 , 'name' , 'a' ;
  9 , 'name' , 'u' ;
};
M_.mapping.c_s.eqidx = [1 3 5 ];
M_.mapping.c_h.eqidx = [2 3 ];
M_.mapping.w.eqidx = [2 4 5 ];
M_.mapping.y.eqidx = [3 6 7 ];
M_.mapping.pi.eqidx = [1 6 7 ];
M_.mapping.i.eqidx = [1 7 ];
M_.mapping.a.eqidx = [1 8 ];
M_.mapping.u.eqidx = [4 9 ];
M_.mapping.n.eqidx = [2 4 5 6 ];
M_.mapping.eps_a.eqidx = [8 ];
M_.mapping.eps_i.eqidx = [7 ];
M_.mapping.eps_u.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 2;
M_.block_structure.block(1).mfs = 2;
M_.block_structure.block(1).equation = [ 8 9];
M_.block_structure.block(1).variable = [ 7 8];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 4;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 ];
M_.block_structure.block(2).Simulation_Type = 7;
M_.block_structure.block(2).endo_nbr = 7;
M_.block_structure.block(2).mfs = 5;
M_.block_structure.block(2).equation = [ 2 3 4 6 1 5 7];
M_.block_structure.block(2).variable = [ 2 4 3 9 6 1 5];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 21;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [0 0 1 2 3 4 5 0 0 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 2 4 5 1 2 4 5 3 5 2 3 4 5 2 5 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 1 1 1 2 2 2 2 3 3 4 4 4 4 5 5 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 5 9 11 15 17 ]);
M_.block_structure.variable_reordered = [ 7 8 2 4 3 9 6 1 5];
M_.block_structure.equation_reordered = [ 8 9 2 3 4 6 1 5 7];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 8 7;
 9 8;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 6;
 1 7;
 2 2;
 2 3;
 2 9;
 3 1;
 3 2;
 3 4;
 4 3;
 4 8;
 4 9;
 5 1;
 5 3;
 5 9;
 6 4;
 6 5;
 6 9;
 7 4;
 7 5;
 7 6;
 8 7;
 9 8;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 5;
 6 5;
];
M_.block_structure.dyn_tmp_nbr = 0;
M_.state_var = [7 8 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(11, 1);
M_.endo_trends = struct('deflator', cell(9, 1), 'log_deflator', cell(9, 1), 'growth_factor', cell(9, 1), 'log_growth_factor', cell(9, 1));
M_.NNZDerivatives = [31; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([8 9 1 3 5 2 3 2 4 5 3 6 7 6 7 1 7 1 8 4 9 2 4 5 6 1 1 6 8 7 9 ]);
M_.dynamic_g1_sparse_colval = int32([7 8 10 10 10 11 11 12 12 12 13 13 13 14 14 15 15 16 16 17 17 18 18 18 18 19 23 23 28 29 30 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 1 1 2 3 3 6 8 11 14 16 18 20 22 26 27 27 27 27 29 29 29 29 29 30 31 32 ]);
M_.lhs = {
'c_s'; 
'c_h'; 
'y'; 
'n'; 
'w'; 
'pi'; 
'i'; 
'a'; 
'u'; 
};
M_.static_tmp_nbr = [1; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 8];
M_.block_structure_stat.block(1).variable = [ 7];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 9];
M_.block_structure_stat.block(2).variable = [ 8];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 7;
M_.block_structure_stat.block(3).mfs = 7;
M_.block_structure_stat.block(3).equation = [ 3 4 5 6 7 1 2];
M_.block_structure_stat.block(3).variable = [ 4 3 1 9 5 6 2];
M_.block_structure_stat.variable_reordered = [ 7 8 4 3 1 9 5 6 2];
M_.block_structure_stat.equation_reordered = [ 8 9 3 4 5 6 7 1 2];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 5;
 1 6;
 1 7;
 2 2;
 2 3;
 2 9;
 3 1;
 3 2;
 3 4;
 4 3;
 4 8;
 4 9;
 5 1;
 5 3;
 5 9;
 6 4;
 6 5;
 6 9;
 7 4;
 7 5;
 7 6;
 8 7;
 9 8;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 4 5 2 3 7 1 3 6 2 3 4 7 4 5 6 5 6 1 7 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 4 4 4 4 5 5 5 6 6 7 7 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 4 7 10 14 17 19 21 ]);
M_.static_g1_sparse_rowval = int32([1 3 5 2 3 2 4 5 3 6 7 1 6 7 1 7 1 8 4 9 2 4 5 6 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 3 3 3 4 4 4 5 5 5 6 6 7 7 8 8 9 9 9 9 ]);
M_.static_g1_sparse_colptr = int32([1 4 6 9 12 15 17 19 21 25 ]);
M_.params(1) = 0.99;
beta_s = M_.params(1);
M_.params(2) = 0.99;
beta_h = M_.params(2);
M_.params(3) = 1.0;
sigma = M_.params(3);
M_.params(4) = 1.0;
gamma = M_.params(4);
M_.params(5) = 0.75;
theta = M_.params(5);
M_.params(11) = 0.25;
lambda_h = M_.params(11);
M_.params(6) = 1.5;
phi_pi = M_.params(6);
M_.params(7) = 0.5;
phi_y = M_.params(7);
M_.params(8) = 0.9;
rho_a = M_.params(8);
M_.params(9) = 0.5;
rho_i = M_.params(9);
M_.params(10) = 0.9;
rho_u = M_.params(10);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 0;
oo_.steady_state(2) = 0;
oo_.steady_state(3) = 0;
oo_.steady_state(4) = 0;
oo_.steady_state(5) = 0;
oo_.steady_state(6) = 0;
oo_.steady_state(7) = 0;
oo_.steady_state(8) = 0;
oo_.steady_state(9) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0001;
M_.Sigma_e(2, 2) = 6.25e-06;
M_.Sigma_e(3, 3) = 0.0001;
options_.solve_tol = 1e-12;
options_resid_ = struct();
display_static_residuals(M_, options_, oo_, options_resid_);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 1;
options_.periods = 1000;
var_list_ = {'c_s';'c_h';'w';'y';'pi';'i'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'tank_model_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
