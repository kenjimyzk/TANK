function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = TANKC_model2.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(2)) - (params(3)*y(9)+params(4)*y(4));
    residual(2) = (y(9)*params(22)/params(24)) - (params(16)*params(18)/params(24)*(y(2)+y(4))+params(11)/params(12)*y(1));
    residual(3) = (y(2)) - (params(3)*y(10)+params(4)*y(5));
    residual(4) = (y(12)) - (y(14));
    residual(5) = (y(7)) - (y(10)*(-(params(3)+params(6)))+y(5)*T(1));
    residual(6) = (y(2)) - (y(6)+y(16)-params(13)*y(3));
    residual(7) = (y(1)) - (y(6)*params(20)*(params(13)-1)-(1+params(20)*(params(13)-1))*y(11));
    residual(8) = (y(14)) - (y(14)*params(1)+y(6)*params(8)*params(20)/params(9));
    residual(9) = (y(12)) - (y(14)*params(7)-y(15));
    residual(10) = (y(13)) - (y(12)-y(14));
    residual(11) = (y(8)) - (y(9)*params(12)*params(22)/params(21)+y(10)*(1-params(12))*params(23)/params(21));
    residual(12) = (y(3)) - (y(4)*params(12)*params(18)/params(17)+y(5)*params(19)/params(17)*(1-params(12)));
    residual(13) = (y(11)) - (y(16)+(1-params(13))*y(3));
    residual(14) = (y(11)) - (y(8));
    residual(15) = (y(16)) - (y(16)*params(14)+x(1));
    residual(16) = (y(15)) - (y(15)*params(15)+x(2));
end
