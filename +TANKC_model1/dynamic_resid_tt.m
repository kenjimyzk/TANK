function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 12);

T(1) = y(11)^params(3);
T(2) = y(6)^params(4);
T(3) = y(12)^params(3);
T(4) = y(7)^params(4);
T(5) = y(12)^((-params(5))-1);
T(6) = exp(params(5)*params(2)*y(7)^(1+params(4))/(1+params(4)));
T(7) = y(5)^(-params(12));
T(8) = 0.5*params(8)*(y(16)-1)^2;
T(9) = y(23)/y(9)*params(1)*params(8)*y(24)/y(13);
T(10) = T(9)*(y(25)-1);
T(11) = y(16)^params(6);
T(12) = exp(y(18))*y(5)^(1-params(12));

end
