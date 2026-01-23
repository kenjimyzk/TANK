function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = TANK_model1.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(19, 1);
    residual(1) = (y(2)) - (T(1)*T(2));
    residual(2) = (y(8)) - (y(2)*y(4)+params(9)/params(10)*y(1));
    residual(3) = (y(2)) - (T(3)*T(4));
    residual(4) = (1) - (params(1)*y(11)/y(13));
    residual(5) = (y(2)) - ((1-params(11))*y(6)*exp(y(15))*T(5));
    residual(6) = (y(1)) - (y(10)-y(10)*T(6)-y(2)*y(3));
    residual(7) = (y(13)*params(7)*(y(13)-1)) - (params(6)*(y(6)-(1+params(8))*(1-1/params(6)))+y(13)*(y(13)-1)*params(1)*params(7));
    residual(8) = (y(11)) - (exp((-y(14)))*1/params(1)*T(7));
    residual(9) = (y(12)) - (y(11)/y(13));
    residual(10) = (y(7)) - (y(8)*params(10)+y(9)*(1-params(10)));
    residual(11) = (y(3)) - (y(4)*params(10)+y(5)*(1-params(10)));
    residual(12) = (y(10)) - (T(8));
    residual(13) = (y(10)) - (y(7));
    residual(14) = (y(15)) - (y(15)*params(12)+x(1));
    residual(15) = (y(14)) - (y(14)*params(13)+x(2));
    residual(16) = (y(16)) - (log(y(7)/(y(7))));
    residual(17) = (y(17)) - (log(y(3)/(y(3))));
    residual(18) = (y(19)) - (log(y(2)/(y(2))));
    residual(19) = (y(18)) - ((y(1)-(y(1)))/(y(10)));
end
