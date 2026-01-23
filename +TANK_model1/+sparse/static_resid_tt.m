function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = y(8)^params(3);
T(2) = y(4)^params(4);
T(3) = y(9)^params(3);
T(4) = y(5)^params(4);
T(5) = y(3)^(-params(11));
T(6) = 0.5*params(7)*(y(13)-1)^2;
T(7) = y(13)^params(5);
T(8) = exp(y(15))*y(3)^(1-params(11));
end
