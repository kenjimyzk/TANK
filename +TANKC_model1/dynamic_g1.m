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
    T = TANKC_model1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 27);
g1(1,4)=1;
g1(1,6)=(-(T(1)*getPowerDeriv(y(6),params(4),1)));
g1(1,11)=(-(T(2)*getPowerDeriv(y(11),params(3),1)));
g1(2,3)=(-(params(10)/params(11)));
g1(2,4)=(-y(6));
g1(2,6)=(-y(4));
g1(2,11)=1;
g1(3,4)=1;
g1(3,7)=(-(T(3)*getPowerDeriv(y(7),params(4),1)));
g1(3,12)=(-(T(4)*getPowerDeriv(y(12),params(3),1)));
g1(4,7)=(-(T(5)*T(6)*params(5)*params(2)*getPowerDeriv(y(7),1+params(4),1)/(1+params(4))));
g1(4,9)=1;
g1(4,12)=(-(T(6)*getPowerDeriv(y(12),(-params(5))-1,1)));
g1(5,9)=(-(y(14)*params(1)*(-y(23))/(y(9)*y(9))/y(25)));
g1(5,23)=(-(y(14)*params(1)*1/y(9)/y(25)));
g1(5,14)=(-(params(1)*y(23)/y(9)/y(25)));
g1(5,25)=(-((-(params(1)*y(23)/y(9)*y(14)))/(y(25)*y(25))));
g1(6,4)=1;
g1(6,5)=(-((1-params(12))*y(8)*exp(y(18))*getPowerDeriv(y(5),(-params(12)),1)));
g1(6,8)=(-(T(7)*(1-params(12))*exp(y(18))));
g1(6,18)=(-((1-params(12))*y(8)*exp(y(18))*T(7)));
g1(7,3)=1;
g1(7,4)=y(5);
g1(7,5)=y(4);
g1(7,13)=(-(1-T(8)));
g1(7,16)=y(13)*0.5*params(8)*2*(y(16)-1);
g1(8,8)=(-params(7));
g1(8,9)=(-(y(25)*(y(25)-1)*y(24)/y(13)*params(1)*params(8)*(-y(23))/(y(9)*y(9))));
g1(8,23)=(-(y(25)*(y(25)-1)*y(24)/y(13)*params(1)*params(8)*1/y(9)));
g1(8,13)=(-(y(25)*(y(25)-1)*y(23)/y(9)*params(1)*params(8)*(-y(24))/(y(13)*y(13))));
g1(8,24)=(-(y(25)*(y(25)-1)*y(23)/y(9)*params(1)*params(8)*1/y(13)));
g1(8,16)=params(8)*(y(16)-1)+params(8)*y(16);
g1(8,25)=(-(T(10)+y(25)*T(9)));
g1(9,14)=1;
g1(9,16)=(-(exp((-y(17)))*1/params(1)*getPowerDeriv(y(16),params(6),1)));
g1(9,17)=(-(T(11)*1/params(1)*(-exp((-y(17))))));
g1(10,14)=(-(1/y(25)));
g1(10,15)=1;
g1(10,25)=(-((-y(14))/(y(25)*y(25))));
g1(11,10)=1;
g1(11,11)=(-params(11));
g1(11,12)=(-(1-params(11)));
g1(12,5)=1;
g1(12,6)=(-params(11));
g1(12,7)=(-(1-params(11)));
g1(13,5)=(-(exp(y(18))*getPowerDeriv(y(5),1-params(12),1)));
g1(13,13)=1;
g1(13,18)=(-T(12));
g1(14,10)=(-1);
g1(14,13)=1;
g1(15,2)=(-params(13));
g1(15,18)=1;
g1(15,26)=(-1);
g1(16,1)=(-params(14));
g1(16,17)=1;
g1(16,27)=(-1);
g1(17,10)=(-(1/(steady_state(8))/(y(10)/(steady_state(8)))));
g1(17,19)=1;
g1(18,5)=(-(1/(steady_state(3))/(y(5)/(steady_state(3)))));
g1(18,20)=1;
g1(19,4)=(-(1/(steady_state(2))/(y(4)/(steady_state(2)))));
g1(19,22)=1;
g1(20,3)=(-(1/(steady_state(11))));
g1(20,21)=1;

end
