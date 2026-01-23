function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(1) = y(29)^params(3);
T(2) = y(24)^params(4);
T(3) = y(30)^params(3);
T(4) = y(25)^params(4);
T(5) = y(30)^((-params(5))-1);
T(6) = exp(params(5)*params(2)*y(25)^(1+params(4))/(1+params(4)));
T(7) = y(23)^(-params(12));
T(8) = 0.5*params(8)*(y(34)-1)^2;
T(9) = y(47)/y(27)*params(1)*params(8)*y(51)/y(31);
T(10) = T(9)*(y(54)-1);
T(11) = y(34)^params(6);
T(12) = exp(y(36))*y(23)^(1-params(12));
end
