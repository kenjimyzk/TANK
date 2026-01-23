function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = TANK_model1.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(10) = getPowerDeriv(y(47)/y(28),(-params(3)),1);
end
