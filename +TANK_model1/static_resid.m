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
    T = TANK_model1.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
    residual(1) = (y(2)) - (T(1)*T(2));
    residual(2) = (y(8)) - (y(2)*y(4)+params(9)/params(10)*y(1));
    residual(3) = (y(2)) - (T(3)*T(4));
    residual(4) = (1) - (params(1)*y(11)/y(13));
    residual(5) = (y(2)) - ((1-params(11))*y(6)*exp(y(15))*T(5));
    residual(6) = (y(1)) - (y(10)-y(10)*T(6)-y(2)*y(3));
    residual(7) = (y(13)*params(7)*(y(13)-1)) - (params(6)*(y(6)-(1+params(8))*(1-1/params(6)))+y(13)*(y(13)-1)*params(1)*params(7));
    residual(8) = (y(11)) - (exp((-y(14)))*1/params(1)*T(7));
    residual(9) = (y(12)) - (y(11)/y(13));
    residual(10) = (y(7)) - (y(8)*params(10)+y(9)*(1-params(10)));
    residual(11) = (y(3)) - (y(4)*params(10)+y(5)*(1-params(10)));
    residual(12) = (y(10)) - (T(8));
    residual(13) = (y(10)) - (y(7));
    residual(14) = (y(15)) - (y(15)*params(12)+x(1));
    residual(15) = (y(14)) - (y(14)*params(13)+x(2));
    residual(16) = (y(16)) - (log(y(7)/(y(7))));
    residual(17) = (y(17)) - (log(y(3)/(y(3))));
    residual(18) = (y(19)) - (log(y(2)/(y(2))));
    residual(19) = (y(18)) - ((y(1)-(y(1)))/(y(10)));

end
