function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = TANKC_model2.static_g1_tt(T, y, x, params);
end
g1 = zeros(16, 16);
g1(1,2)=1;
g1(1,4)=(-params(4));
g1(1,9)=(-params(3));
g1(2,1)=(-(params(11)/params(12)));
g1(2,2)=(-(params(16)*params(18)/params(24)));
g1(2,4)=(-(params(16)*params(18)/params(24)));
g1(2,9)=params(22)/params(24);
g1(3,2)=1;
g1(3,5)=(-params(4));
g1(3,10)=(-params(3));
g1(4,12)=1;
g1(4,14)=(-1);
g1(5,5)=(-T(1));
g1(5,7)=1;
g1(5,10)=params(3)+params(6);
g1(6,2)=1;
g1(6,3)=params(13);
g1(6,6)=(-1);
g1(6,16)=(-1);
g1(7,1)=1;
g1(7,6)=(-(params(20)*(params(13)-1)));
g1(7,11)=1+params(20)*(params(13)-1);
g1(8,6)=(-(params(8)*params(20)/params(9)));
g1(8,14)=1-params(1);
g1(9,12)=1;
g1(9,14)=(-params(7));
g1(9,15)=1;
g1(10,12)=(-1);
g1(10,13)=1;
g1(10,14)=1;
g1(11,8)=1;
g1(11,9)=(-(params(12)*params(22)/params(21)));
g1(11,10)=(-((1-params(12))*params(23)/params(21)));
g1(12,3)=1;
g1(12,4)=(-(params(12)*params(18)/params(17)));
g1(12,5)=(-(params(19)/params(17)*(1-params(12))));
g1(13,3)=(-(1-params(13)));
g1(13,11)=1;
g1(13,16)=(-1);
g1(14,8)=(-1);
g1(14,11)=1;
g1(15,16)=1-params(14);
g1(16,15)=1-params(15);

end
