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

assert(length(T) >= 10);

T(1) = y(9)^params(3);
T(2) = y(4)^params(4);
T(3) = y(10)^params(3);
T(4) = y(5)^params(4);
T(5) = y(10)^((-params(5))-1);
T(6) = exp(params(5)*params(2)*y(5)^(1+params(4))/(1+params(4)));
T(7) = y(3)^(-params(12));
T(8) = 0.5*params(8)*(y(14)-1)^2;
T(9) = y(14)^params(6);
T(10) = exp(y(16))*y(3)^(1-params(12));

end
