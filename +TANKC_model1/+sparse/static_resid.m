function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = TANKC_model1.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(20, 1);
    residual(1) = (y(2)) - (T(1)*T(2));
    residual(2) = (y(9)) - (y(2)*y(4)+params(10)/params(11)*y(1));
    residual(3) = (y(2)) - (T(3)*T(4));
    residual(4) = (y(7)) - (T(5)*T(6));
    residual(5) = (1) - (params(1)*y(12)/y(14));
    residual(6) = (y(2)) - ((1-params(12))*y(6)*exp(y(16))*T(7));
    residual(7) = (y(1)) - (y(11)-y(11)*T(8)-y(2)*y(3));
    residual(8) = (y(14)*params(8)*(y(14)-1)) - (params(7)*(y(6)-(1+params(9))*(1-1/params(7)))+y(14)*(y(14)-1)*params(1)*params(8));
    residual(9) = (y(12)) - (exp((-y(15)))*1/params(1)*T(9));
    residual(10) = (y(13)) - (y(12)/y(14));
    residual(11) = (y(8)) - (y(9)*params(11)+y(10)*(1-params(11)));
    residual(12) = (y(3)) - (y(4)*params(11)+y(5)*(1-params(11)));
    residual(13) = (y(11)) - (T(10));
    residual(14) = (y(11)) - (y(8));
    residual(15) = (y(16)) - (y(16)*params(13)+x(1));
    residual(16) = (y(15)) - (y(15)*params(14)+x(2));
    residual(17) = (y(17)) - (log(y(8)/(y(8))));
    residual(18) = (y(18)) - (log(y(3)/(y(3))));
    residual(19) = (y(20)) - (log(y(2)/(y(2))));
    residual(20) = (y(19)) - ((y(1)-(y(1)))/(y(11)));
end
