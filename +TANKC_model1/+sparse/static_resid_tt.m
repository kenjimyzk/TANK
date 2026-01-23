function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(1) = y(9)^params(3);
T(2) = y(4)^params(4);
T(3) = y(10)^params(3);
T(4) = y(5)^params(4);
T(5) = y(10)^((-params(5))-1);
T(6) = exp(params(5)*params(2)*y(5)^(1+params(4))/(1+params(4)));
T(7) = y(3)^(-params(12));
T(8) = 0.5*params(8)*(y(14)-1)^2;
T(9) = y(14)^params(6);
T(10) = exp(y(16))*y(3)^(1-params(12));
end
