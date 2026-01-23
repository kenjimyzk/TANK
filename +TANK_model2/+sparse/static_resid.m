function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = TANK_model2.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(15, 1);
    residual(1) = (y(2)) - (params(3)*y(8)+params(4)*y(4));
    residual(2) = (y(8)*params(20)/params(22)) - (params(14)*params(16)/params(22)*(y(2)+y(4))+params(9)/params(10)*y(1));
    residual(3) = (y(2)) - (params(3)*y(9)+params(4)*y(5));
    residual(4) = (y(11)) - (y(13));
    residual(5) = (y(2)) - (y(6)+y(15)-params(11)*y(3));
    residual(6) = (y(1)) - (y(6)*(params(11)-1)*params(18)+(1+(params(11)-1)*params(18))*y(10));
    residual(7) = (y(13)) - (y(13)*params(1)+y(6)*params(18)*params(6)/params(7));
    residual(8) = (y(11)) - (y(13)*params(5)-y(14));
    residual(9) = (y(12)) - (y(11)-y(13));
    residual(10) = (y(7)) - (y(8)*params(10)*params(20)/params(19)+y(9)*(1-params(10))*params(21)/params(19));
    residual(11) = (y(3)) - (y(4)*params(10)*params(16)/params(15)+y(5)*(1-params(10))*params(17)/params(15));
    residual(12) = (y(10)) - (y(15)+y(3)*(1-params(11)));
    residual(13) = (y(10)) - (y(7));
    residual(14) = (y(15)) - (y(15)*params(12)+x(1));
    residual(15) = (y(14)) - (y(14)*params(13)+x(2));
end
