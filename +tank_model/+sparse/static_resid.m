function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = tank_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (y(1)) - (y(1)*params(1)-T(1)*(y(6)-y(5)-params(8)*y(7)));
    residual(2) = (y(2)) - (y(3)+y(9));
    residual(3) = (y(4)) - (y(2)*params(11)+y(1)*(1-params(11)));
    residual(4) = (y(9)) - (y(3)*(-params(4))+y(8));
    residual(5) = (y(3)) - (y(1)*params(3)+y(9)*params(4));
    residual(6) = (y(5)) - (params(1)*y(5)+(params(3)+params(4))/params(5)*(y(4)-y(9)));
    residual(7) = (y(6)) - (y(5)*params(6)+y(4)*params(7)+x(2));
    residual(8) = (y(7)) - (params(8)*y(7)+x(1));
    residual(9) = (y(8)) - (y(8)*params(10)+x(3));
end
