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
    T = TANK_model2.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
    residual(1) = (y(2)) - (params(3)*y(8)+params(4)*y(4));
    residual(2) = (y(8)*params(20)/params(22)) - (params(14)*params(16)/params(22)*(y(2)+y(4))+params(9)/params(10)*y(1));
    residual(3) = (y(2)) - (params(3)*y(9)+params(4)*y(5));
    residual(4) = (y(11)) - (y(13));
    residual(5) = (y(2)) - (y(6)+y(15)-params(11)*y(3));
    residual(6) = (y(1)) - (y(6)*(params(11)-1)*params(18)+(1+(params(11)-1)*params(18))*y(10));
    residual(7) = (y(13)) - (y(13)*params(1)+y(6)*params(18)*params(6)/params(7));
    residual(8) = (y(11)) - (y(13)*params(5)-y(14));
    residual(9) = (y(12)) - (y(11)-y(13));
    residual(10) = (y(7)) - (y(8)*params(10)*params(20)/params(19)+y(9)*(1-params(10))*params(21)/params(19));
    residual(11) = (y(3)) - (y(4)*params(10)*params(16)/params(15)+y(5)*(1-params(10))*params(17)/params(15));
    residual(12) = (y(10)) - (y(15)+y(3)*(1-params(11)));
    residual(13) = (y(10)) - (y(7));
    residual(14) = (y(15)) - (y(15)*params(12)+x(1));
    residual(15) = (y(14)) - (y(14)*params(13)+x(2));

end
