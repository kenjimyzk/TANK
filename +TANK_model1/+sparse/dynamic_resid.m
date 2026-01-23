function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(9, 1);
end
[T_order, T] = TANK_model1.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(19, 1);
    residual(1) = (y(21)) - (T(1)*T(2));
    residual(2) = (y(27)) - (y(21)*y(23)+params(9)/params(10)*y(20));
    residual(3) = (y(21)) - (T(3)*T(4));
    residual(4) = (1) - (params(1)*T(5)*y(30)/y(51));
    residual(5) = (y(21)) - ((1-params(11))*y(25)*exp(y(34))*T(6));
    residual(6) = (y(20)) - (y(29)-y(29)*T(7)-y(21)*y(22));
    residual(7) = (y(32)*params(7)*(y(32)-1)) - (params(6)*(y(25)-(1+params(8))*(1-1/params(6)))+y(51)*T(5)*params(1)*params(7)*y(48)/y(29)*(y(51)-1));
    residual(8) = (y(30)) - (exp((-y(33)))*1/params(1)*T(8));
    residual(9) = (y(31)) - (y(30)/y(51));
    residual(10) = (y(26)) - (y(27)*params(10)+y(28)*(1-params(10)));
    residual(11) = (y(22)) - (y(23)*params(10)+y(24)*(1-params(10)));
    residual(12) = (y(29)) - (T(9));
    residual(13) = (y(29)) - (y(26));
    residual(14) = (y(34)) - (params(12)*y(15)+x(1));
    residual(15) = (y(33)) - (params(13)*y(14)+x(2));
    residual(16) = (y(35)) - (log(y(26)/(steady_state(7))));
    residual(17) = (y(36)) - (log(y(22)/(steady_state(3))));
    residual(18) = (y(38)) - (log(y(21)/(steady_state(2))));
    residual(19) = (y(37)) - ((y(20)-(steady_state(1)))/(steady_state(10)));
end
