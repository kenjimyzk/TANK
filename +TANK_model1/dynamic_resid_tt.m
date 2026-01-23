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

assert(length(T) >= 9);

T(1) = y(10)^params(3);
T(2) = y(6)^params(4);
T(3) = y(11)^params(3);
T(4) = y(7)^params(4);
T(5) = (y(22)/y(11))^(-params(3));
T(6) = y(5)^(-params(11));
T(7) = 0.5*params(7)*(y(15)-1)^2;
T(8) = y(15)^params(5);
T(9) = exp(y(17))*y(5)^(1-params(11));

end
