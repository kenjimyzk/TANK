clear all

dynare TANKC_model0.mod -DFLAG=0 -DALPHA=0 -DPHI=0
x000 = oo_.steady_state(1:6)

dynare TANKC_model0.mod -DFLAG=0 -DALPHA=1 -DPHI=0
x010 = oo_.steady_state(1:6)

dynare TANKC_model0.mod -DFLAG=0 -DALPHA=0 -DPHI=1
x001 = oo_.steady_state(1:6)

dynare TANKC_model0.mod -DFLAG=0 -DALPHA=1 -DPHI=1
x011 = oo_.steady_state(1:6)


dynare TANKC_model0.mod -DFLAG=1 -DALPHA=0 -DPHI=0
x100 = oo_.steady_state(1:4)

dynare TANKC_model0.mod -DFLAG=1 -DALPHA=1 -DPHI=0
x110 = oo_.steady_state(1:4)

dynare TANKC_model0.mod -DFLAG=1 -DALPHA=0 -DPHI=1
x101 = oo_.steady_state(1:4)

dynare TANKC_model0.mod -DFLAG=1 -DALPHA=1 -DPHI=1
x111 = oo_.steady_state(1:4)

% Display x000, x001, x010, x011 with rows as cases and columns as variables
% (transpose so each row is one case: x000, x001, x010, x011)
result_x = [x000, x010, x001, x011]';
varnames = {'s1','s2','s3','s4','s5','s6'}; % steady-state variable labels (1:3)
rownames = {'x000','x010','x001','x011'};
try
  T = array2table(result_x, 'VariableNames', varnames, 'RowNames', rownames);
  disp(T)
catch
  disp('rows [x000; x010; x001; x011] =')
  disp(result_x)
end

% Display x100, x101, x110, x111 with rows as cases and columns as variables
% (transpose so each row is one case: x100, x101, x110, x111)
result_x1 = [x100, x110, x101, x111]';
varnames1 = {'s1','s2','s3','s4'}; % steady-state variable labels (1:4)
rownames1 = {'x100','x110','x101','x111'};
try
  T1 = array2table(result_x1, 'VariableNames', varnames1, 'RowNames', rownames1);
  disp(T1)
catch
  disp('rows [x100; x110; x101; x111] =')
  disp(result_x1)
end


