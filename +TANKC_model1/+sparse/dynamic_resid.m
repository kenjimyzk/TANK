function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = TANKC_model1.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(20, 1);
    residual(1) = (y(22)) - (T(1)*T(2));
    residual(2) = (y(29)) - (y(22)*y(24)+params(10)/params(11)*y(21));
    residual(3) = (y(22)) - (T(3)*T(4));
    residual(4) = (y(27)) - (T(5)*T(6));
    residual(5) = (1) - (params(1)*y(47)/y(27)*y(32)/y(54));
    residual(6) = (y(22)) - ((1-params(12))*y(26)*exp(y(36))*T(7));
    residual(7) = (y(21)) - (y(31)-y(31)*T(8)-y(22)*y(23));
    residual(8) = (y(34)*params(8)*(y(34)-1)) - (params(7)*(y(26)-(1+params(9))*(1-1/params(7)))+y(54)*T(10));
    residual(9) = (y(32)) - (exp((-y(35)))*1/params(1)*T(11));
    residual(10) = (y(33)) - (y(32)/y(54));
    residual(11) = (y(28)) - (y(29)*params(11)+y(30)*(1-params(11)));
    residual(12) = (y(23)) - (y(24)*params(11)+y(25)*(1-params(11)));
    residual(13) = (y(31)) - (T(12));
    residual(14) = (y(31)) - (y(28));
    residual(15) = (y(36)) - (params(13)*y(16)+x(1));
    residual(16) = (y(35)) - (params(14)*y(15)+x(2));
    residual(17) = (y(37)) - (log(y(28)/(steady_state(8))));
    residual(18) = (y(38)) - (log(y(23)/(steady_state(3))));
    residual(19) = (y(40)) - (log(y(22)/(steady_state(2))));
    residual(20) = (y(39)) - ((y(21)-(steady_state(1)))/(steady_state(11)));
end
