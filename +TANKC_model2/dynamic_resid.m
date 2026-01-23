function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = TANKC_model2.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(16, 1);
    residual(1) = (y(4)) - (params(3)*y(11)+params(4)*y(6));
    residual(2) = (y(11)*params(22)/params(24)) - (params(16)*params(18)/params(24)*(y(4)+y(6))+params(11)/params(12)*y(3));
    residual(3) = (y(4)) - (params(3)*y(12)+params(4)*y(7));
    residual(4) = (y(14)) - (y(20)+y(9)-y(19));
    residual(5) = (y(9)) - (y(12)*(-(params(3)+params(6)))+y(7)*T(1));
    residual(6) = (y(4)) - (y(8)+y(18)-params(13)*y(5));
    residual(7) = (y(3)) - (y(8)*params(20)*(params(13)-1)-(1+params(20)*(params(13)-1))*y(13));
    residual(8) = (y(16)) - (y(20)*params(1)+y(8)*params(8)*params(20)/params(9));
    residual(9) = (y(14)) - (y(16)*params(7)-y(17));
    residual(10) = (y(15)) - (y(14)-y(20));
    residual(11) = (y(10)) - (y(11)*params(12)*params(22)/params(21)+y(12)*(1-params(12))*params(23)/params(21));
    residual(12) = (y(5)) - (y(6)*params(12)*params(18)/params(17)+y(7)*params(19)/params(17)*(1-params(12)));
    residual(13) = (y(13)) - (y(18)+(1-params(13))*y(5));
    residual(14) = (y(13)) - (y(10));
    residual(15) = (y(18)) - (params(14)*y(2)+x(it_, 1));
    residual(16) = (y(17)) - (params(15)*y(1)+x(it_, 2));

end
