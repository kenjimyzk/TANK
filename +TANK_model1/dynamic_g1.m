function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = TANK_model1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 26);
g1(1,4)=1;
g1(1,6)=(-(T(1)*getPowerDeriv(y(6),params(4),1)));
g1(1,10)=(-(T(2)*getPowerDeriv(y(10),params(3),1)));
g1(2,3)=(-(params(9)/params(10)));
g1(2,4)=(-y(6));
g1(2,6)=(-y(4));
g1(2,10)=1;
g1(3,4)=1;
g1(3,7)=(-(T(3)*getPowerDeriv(y(7),params(4),1)));
g1(3,11)=(-(T(4)*getPowerDeriv(y(11),params(3),1)));
g1(4,11)=(-(y(13)*params(1)*(-y(22))/(y(11)*y(11))*T(10)/y(24)));
g1(4,22)=(-(y(13)*params(1)*T(10)*1/y(11)/y(24)));
g1(4,13)=(-(params(1)*T(5)/y(24)));
g1(4,24)=(-((-(params(1)*T(5)*y(13)))/(y(24)*y(24))));
g1(5,4)=1;
g1(5,5)=(-((1-params(11))*y(8)*exp(y(17))*getPowerDeriv(y(5),(-params(11)),1)));
g1(5,8)=(-(T(6)*(1-params(11))*exp(y(17))));
g1(5,17)=(-((1-params(11))*y(8)*exp(y(17))*T(6)));
g1(6,3)=1;
g1(6,4)=y(5);
g1(6,5)=y(4);
g1(6,12)=(-(1-T(7)));
g1(6,15)=y(12)*0.5*params(7)*2*(y(15)-1);
g1(7,8)=(-params(6));
g1(7,11)=(-(y(24)*(y(24)-1)*y(23)/y(12)*params(1)*params(7)*(-y(22))/(y(11)*y(11))*T(10)));
g1(7,22)=(-(y(24)*(y(24)-1)*y(23)/y(12)*params(1)*params(7)*T(10)*1/y(11)));
g1(7,12)=(-(y(24)*(y(24)-1)*T(5)*params(1)*params(7)*(-y(23))/(y(12)*y(12))));
g1(7,23)=(-(y(24)*(y(24)-1)*T(5)*params(1)*params(7)*1/y(12)));
g1(7,15)=params(7)*(y(15)-1)+params(7)*y(15);
g1(7,24)=(-(T(5)*params(1)*params(7)*y(23)/y(12)*(y(24)-1)+y(24)*T(5)*params(1)*params(7)*y(23)/y(12)));
g1(8,13)=1;
g1(8,15)=(-(exp((-y(16)))*1/params(1)*getPowerDeriv(y(15),params(5),1)));
g1(8,16)=(-(T(8)*1/params(1)*(-exp((-y(16))))));
g1(9,13)=(-(1/y(24)));
g1(9,14)=1;
g1(9,24)=(-((-y(13))/(y(24)*y(24))));
g1(10,9)=1;
g1(10,10)=(-params(10));
g1(10,11)=(-(1-params(10)));
g1(11,5)=1;
g1(11,6)=(-params(10));
g1(11,7)=(-(1-params(10)));
g1(12,5)=(-(exp(y(17))*getPowerDeriv(y(5),1-params(11),1)));
g1(12,12)=1;
g1(12,17)=(-T(9));
g1(13,9)=(-1);
g1(13,12)=1;
g1(14,2)=(-params(12));
g1(14,17)=1;
g1(14,25)=(-1);
g1(15,1)=(-params(13));
g1(15,16)=1;
g1(15,26)=(-1);
g1(16,9)=(-(1/(steady_state(7))/(y(9)/(steady_state(7)))));
g1(16,18)=1;
g1(17,5)=(-(1/(steady_state(3))/(y(5)/(steady_state(3)))));
g1(17,19)=1;
g1(18,4)=(-(1/(steady_state(2))/(y(4)/(steady_state(2)))));
g1(18,21)=1;
g1(19,3)=(-(1/(steady_state(10))));
g1(19,20)=1;

end
