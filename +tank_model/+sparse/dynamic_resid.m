function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = tank_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(10)) - (params(1)*y(19)-T(1)*(y(15)-y(23)-params(8)*y(16)));
    residual(2) = (y(11)) - (y(12)+y(18));
    residual(3) = (y(13)) - (y(11)*params(11)+y(10)*(1-params(11)));
    residual(4) = (y(18)) - (y(12)*(-params(4))+y(17));
    residual(5) = (y(12)) - (y(10)*params(3)+y(18)*params(4));
    residual(6) = (y(14)) - (params(1)*y(23)+(params(3)+params(4))/params(5)*(y(13)-y(18)));
    residual(7) = (y(15)) - (y(14)*params(6)+y(13)*params(7)+x(2));
    residual(8) = (y(16)) - (params(8)*y(7)+x(1));
    residual(9) = (y(17)) - (params(10)*y(8)+x(3));
end
