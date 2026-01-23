function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 8);

T(1) = y(8)^params(3);
T(2) = y(4)^params(4);
T(3) = y(9)^params(3);
T(4) = y(5)^params(4);
T(5) = y(3)^(-params(11));
T(6) = 0.5*params(7)*(y(13)-1)^2;
T(7) = y(13)^params(5);
T(8) = exp(y(15))*y(3)^(1-params(11));

end
