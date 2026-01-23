function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = tank_model.static_resid_tt(T, y, x, params);
end
residual = zeros(9, 1);
    residual(1) = (y(1)) - (y(1)*params(1)-T(1)*(y(6)-y(5)-params(8)*y(7)));
    residual(2) = (y(2)) - (y(3)+y(9));
    residual(3) = (y(4)) - (y(2)*params(11)+y(1)*(1-params(11)));
    residual(4) = (y(9)) - (y(3)*(-params(4))+y(8));
    residual(5) = (y(3)) - (y(1)*params(3)+y(9)*params(4));
    residual(6) = (y(5)) - (params(1)*y(5)+(params(3)+params(4))/params(5)*(y(4)-y(9)));
    residual(7) = (y(6)) - (y(5)*params(6)+y(4)*params(7)+x(2));
    residual(8) = (y(7)) - (params(8)*y(7)+x(1));
    residual(9) = (y(8)) - (y(8)*params(10)+x(3));

end
