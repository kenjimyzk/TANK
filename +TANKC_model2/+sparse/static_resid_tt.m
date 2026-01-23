function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 1
    T = [T; NaN(1 - size(T, 1), 1)];
end
T(1) = params(6)*(1-params(13))*params(20)*params(19)/params(17)/(params(23)/params(24));
end
