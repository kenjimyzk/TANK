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
    T = TANK_model2.static_g1_tt(T, y, x, params);
end
g1 = zeros(15, 15);
g1(1,2)=1;
g1(1,4)=(-params(4));
g1(1,8)=(-params(3));
g1(2,1)=(-(params(9)/params(10)));
g1(2,2)=(-(params(14)*params(16)/params(22)));
g1(2,4)=(-(params(14)*params(16)/params(22)));
g1(2,8)=params(20)/params(22);
g1(3,2)=1;
g1(3,5)=(-params(4));
g1(3,9)=(-params(3));
g1(4,11)=1;
g1(4,13)=(-1);
g1(5,2)=1;
g1(5,3)=params(11);
g1(5,6)=(-1);
g1(5,15)=(-1);
g1(6,1)=1;
g1(6,6)=(-((params(11)-1)*params(18)));
g1(6,10)=(-(1+(params(11)-1)*params(18)));
g1(7,6)=(-(params(18)*params(6)/params(7)));
g1(7,13)=1-params(1);
g1(8,11)=1;
g1(8,13)=(-params(5));
g1(8,14)=1;
g1(9,11)=(-1);
g1(9,12)=1;
g1(9,13)=1;
g1(10,7)=1;
g1(10,8)=(-(params(10)*params(20)/params(19)));
g1(10,9)=(-((1-params(10))*params(21)/params(19)));
g1(11,3)=1;
g1(11,4)=(-(params(10)*params(16)/params(15)));
g1(11,5)=(-((1-params(10))*params(17)/params(15)));
g1(12,3)=(-(1-params(11)));
g1(12,10)=1;
g1(12,15)=(-1);
g1(13,7)=(-1);
g1(13,10)=1;
g1(14,15)=1-params(12);
g1(15,14)=1-params(13);

end
