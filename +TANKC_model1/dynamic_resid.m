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
    T = TANKC_model1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(20, 1);
    residual(1) = (y(4)) - (T(1)*T(2));
    residual(2) = (y(11)) - (y(4)*y(6)+params(10)/params(11)*y(3));
    residual(3) = (y(4)) - (T(3)*T(4));
    residual(4) = (y(9)) - (T(5)*T(6));
    residual(5) = (1) - (params(1)*y(23)/y(9)*y(14)/y(25));
    residual(6) = (y(4)) - ((1-params(12))*y(8)*exp(y(18))*T(7));
    residual(7) = (y(3)) - (y(13)-y(13)*T(8)-y(4)*y(5));
    residual(8) = (y(16)*params(8)*(y(16)-1)) - (params(7)*(y(8)-(1+params(9))*(1-1/params(7)))+y(25)*T(10));
    residual(9) = (y(14)) - (exp((-y(17)))*1/params(1)*T(11));
    residual(10) = (y(15)) - (y(14)/y(25));
    residual(11) = (y(10)) - (y(11)*params(11)+y(12)*(1-params(11)));
    residual(12) = (y(5)) - (y(6)*params(11)+y(7)*(1-params(11)));
    residual(13) = (y(13)) - (T(12));
    residual(14) = (y(13)) - (y(10));
    residual(15) = (y(18)) - (params(13)*y(2)+x(it_, 1));
    residual(16) = (y(17)) - (params(14)*y(1)+x(it_, 2));
    residual(17) = (y(19)) - (log(y(10)/(steady_state(8))));
    residual(18) = (y(20)) - (log(y(5)/(steady_state(3))));
    residual(19) = (y(22)) - (log(y(4)/(steady_state(2))));
    residual(20) = (y(21)) - ((y(3)-(steady_state(1)))/(steady_state(11)));

end
