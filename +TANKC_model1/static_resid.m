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
    T = TANKC_model1.static_resid_tt(T, y, x, params);
end
residual = zeros(20, 1);
    residual(1) = (y(2)) - (T(1)*T(2));
    residual(2) = (y(9)) - (y(2)*y(4)+params(10)/params(11)*y(1));
    residual(3) = (y(2)) - (T(3)*T(4));
    residual(4) = (y(7)) - (T(5)*T(6));
    residual(5) = (1) - (params(1)*y(12)/y(14));
    residual(6) = (y(2)) - ((1-params(12))*y(6)*exp(y(16))*T(7));
    residual(7) = (y(1)) - (y(11)-y(11)*T(8)-y(2)*y(3));
    residual(8) = (y(14)*params(8)*(y(14)-1)) - (params(7)*(y(6)-(1+params(9))*(1-1/params(7)))+y(14)*(y(14)-1)*params(1)*params(8));
    residual(9) = (y(12)) - (exp((-y(15)))*1/params(1)*T(9));
    residual(10) = (y(13)) - (y(12)/y(14));
    residual(11) = (y(8)) - (y(9)*params(11)+y(10)*(1-params(11)));
    residual(12) = (y(3)) - (y(4)*params(11)+y(5)*(1-params(11)));
    residual(13) = (y(11)) - (T(10));
    residual(14) = (y(11)) - (y(8));
    residual(15) = (y(16)) - (y(16)*params(13)+x(1));
    residual(16) = (y(15)) - (y(15)*params(14)+x(2));
    residual(17) = (y(17)) - (log(y(8)/(y(8))));
    residual(18) = (y(18)) - (log(y(3)/(y(3))));
    residual(19) = (y(20)) - (log(y(2)/(y(2))));
    residual(20) = (y(19)) - ((y(1)-(y(1)))/(y(11)));

end
