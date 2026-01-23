function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(1) = y(27)^params(3);
T(2) = y(23)^params(4);
T(3) = y(28)^params(3);
T(4) = y(24)^params(4);
T(5) = (y(47)/y(28))^(-params(3));
T(6) = y(22)^(-params(11));
T(7) = 0.5*params(7)*(y(32)-1)^2;
T(8) = y(32)^params(5);
T(9) = exp(y(34))*y(22)^(1-params(11));
end
