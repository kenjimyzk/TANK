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
    T = TANKC_model1.static_g1_tt(T, y, x, params);
end
g1 = zeros(20, 20);
g1(1,2)=1;
g1(1,4)=(-(T(1)*getPowerDeriv(y(4),params(4),1)));
g1(1,9)=(-(T(2)*getPowerDeriv(y(9),params(3),1)));
g1(2,1)=(-(params(10)/params(11)));
g1(2,2)=(-y(4));
g1(2,4)=(-y(2));
g1(2,9)=1;
g1(3,2)=1;
g1(3,5)=(-(T(3)*getPowerDeriv(y(5),params(4),1)));
g1(3,10)=(-(T(4)*getPowerDeriv(y(10),params(3),1)));
g1(4,5)=(-(T(5)*T(6)*params(5)*params(2)*getPowerDeriv(y(5),1+params(4),1)/(1+params(4))));
g1(4,7)=1;
g1(4,10)=(-(T(6)*getPowerDeriv(y(10),(-params(5))-1,1)));
g1(5,12)=(-(params(1)/y(14)));
g1(5,14)=(-((-(params(1)*y(12)))/(y(14)*y(14))));
g1(6,2)=1;
g1(6,3)=(-((1-params(12))*y(6)*exp(y(16))*getPowerDeriv(y(3),(-params(12)),1)));
g1(6,6)=(-(T(7)*(1-params(12))*exp(y(16))));
g1(6,16)=(-((1-params(12))*y(6)*exp(y(16))*T(7)));
g1(7,1)=1;
g1(7,2)=y(3);
g1(7,3)=y(2);
g1(7,11)=(-(1-T(8)));
g1(7,14)=y(11)*0.5*params(8)*2*(y(14)-1);
g1(8,6)=(-params(7));
g1(8,14)=params(8)*(y(14)-1)+y(14)*params(8)-((y(14)-1)*params(1)*params(8)+y(14)*params(1)*params(8));
g1(9,12)=1;
g1(9,14)=(-(exp((-y(15)))*1/params(1)*getPowerDeriv(y(14),params(6),1)));
g1(9,15)=(-(T(9)*1/params(1)*(-exp((-y(15))))));
g1(10,12)=(-(1/y(14)));
g1(10,13)=1;
g1(10,14)=(-((-y(12))/(y(14)*y(14))));
g1(11,8)=1;
g1(11,9)=(-params(11));
g1(11,10)=(-(1-params(11)));
g1(12,3)=1;
g1(12,4)=(-params(11));
g1(12,5)=(-(1-params(11)));
g1(13,3)=(-(exp(y(16))*getPowerDeriv(y(3),1-params(12),1)));
g1(13,11)=1;
g1(13,16)=(-T(10));
g1(14,8)=(-1);
g1(14,11)=1;
g1(15,16)=1-params(13);
g1(16,15)=1-params(14);
g1(17,8)=(-(((y(8))-y(8))/((y(8))*(y(8)))/(y(8)/(y(8)))));
g1(17,17)=1;
g1(18,3)=(-(((y(3))-y(3))/((y(3))*(y(3)))/(y(3)/(y(3)))));
g1(18,18)=1;
g1(19,2)=(-(((y(2))-y(2))/((y(2))*(y(2)))/(y(2)/(y(2)))));
g1(19,20)=1;
g1(20,11)=(-((-(y(1)-(y(1))))/((y(11))*(y(11)))));
g1(20,19)=1;

end
