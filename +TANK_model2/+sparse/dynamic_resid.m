function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = TANK_model2.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(15, 1);
    residual(1) = (y(17)) - (params(3)*y(23)+params(4)*y(19));
    residual(2) = (y(23)*params(20)/params(22)) - (params(14)*params(16)/params(22)*(y(17)+y(19))+params(9)/params(10)*y(16));
    residual(3) = (y(17)) - (params(3)*y(24)+params(4)*y(20));
    residual(4) = (y(26)) - (y(43)+params(3)*(y(39)-y(24)));
    residual(5) = (y(17)) - (y(21)+y(30)-params(11)*y(18));
    residual(6) = (y(16)) - (y(21)*(params(11)-1)*params(18)+(1+(params(11)-1)*params(18))*y(25));
    residual(7) = (y(28)) - (y(43)*params(1)+y(21)*params(18)*params(6)/params(7));
    residual(8) = (y(26)) - (y(28)*params(5)-y(29));
    residual(9) = (y(27)) - (y(26)-y(43));
    residual(10) = (y(22)) - (y(23)*params(10)*params(20)/params(19)+y(24)*(1-params(10))*params(21)/params(19));
    residual(11) = (y(18)) - (y(19)*params(10)*params(16)/params(15)+y(20)*(1-params(10))*params(17)/params(15));
    residual(12) = (y(25)) - (y(30)+y(18)*(1-params(11)));
    residual(13) = (y(25)) - (y(22));
    residual(14) = (y(30)) - (params(12)*y(15)+x(1));
    residual(15) = (y(29)) - (params(13)*y(14)+x(2));
end
