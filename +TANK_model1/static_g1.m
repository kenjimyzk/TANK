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
    T = TANK_model1.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,2)=1;
g1(1,4)=(-(T(1)*getPowerDeriv(y(4),params(4),1)));
g1(1,8)=(-(T(2)*getPowerDeriv(y(8),params(3),1)));
g1(2,1)=(-(params(9)/params(10)));
g1(2,2)=(-y(4));
g1(2,4)=(-y(2));
g1(2,8)=1;
g1(3,2)=1;
g1(3,5)=(-(T(3)*getPowerDeriv(y(5),params(4),1)));
g1(3,9)=(-(T(4)*getPowerDeriv(y(9),params(3),1)));
g1(4,11)=(-(params(1)/y(13)));
g1(4,13)=(-((-(params(1)*y(11)))/(y(13)*y(13))));
g1(5,2)=1;
g1(5,3)=(-((1-params(11))*y(6)*exp(y(15))*getPowerDeriv(y(3),(-params(11)),1)));
g1(5,6)=(-(T(5)*(1-params(11))*exp(y(15))));
g1(5,15)=(-((1-params(11))*y(6)*exp(y(15))*T(5)));
g1(6,1)=1;
g1(6,2)=y(3);
g1(6,3)=y(2);
g1(6,10)=(-(1-T(6)));
g1(6,13)=y(10)*0.5*params(7)*2*(y(13)-1);
g1(7,6)=(-params(6));
g1(7,13)=params(7)*(y(13)-1)+y(13)*params(7)-((y(13)-1)*params(1)*params(7)+y(13)*params(1)*params(7));
g1(8,11)=1;
g1(8,13)=(-(exp((-y(14)))*1/params(1)*getPowerDeriv(y(13),params(5),1)));
g1(8,14)=(-(T(7)*1/params(1)*(-exp((-y(14))))));
g1(9,11)=(-(1/y(13)));
g1(9,12)=1;
g1(9,13)=(-((-y(11))/(y(13)*y(13))));
g1(10,7)=1;
g1(10,8)=(-params(10));
g1(10,9)=(-(1-params(10)));
g1(11,3)=1;
g1(11,4)=(-params(10));
g1(11,5)=(-(1-params(10)));
g1(12,3)=(-(exp(y(15))*getPowerDeriv(y(3),1-params(11),1)));
g1(12,10)=1;
g1(12,15)=(-T(8));
g1(13,7)=(-1);
g1(13,10)=1;
g1(14,15)=1-params(12);
g1(15,14)=1-params(13);
g1(16,7)=(-(((y(7))-y(7))/((y(7))*(y(7)))/(y(7)/(y(7)))));
g1(16,16)=1;
g1(17,3)=(-(((y(3))-y(3))/((y(3))*(y(3)))/(y(3)/(y(3)))));
g1(17,17)=1;
g1(18,2)=(-(((y(2))-y(2))/((y(2))*(y(2)))/(y(2)/(y(2)))));
g1(18,19)=1;
g1(19,10)=(-((-(y(1)-(y(1))))/((y(10))*(y(10)))));
g1(19,18)=1;

end
