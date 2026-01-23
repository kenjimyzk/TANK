function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = TANKC_model2.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(16, 1);
    residual(1) = (y(18)) - (params(3)*y(25)+params(4)*y(20));
    residual(2) = (y(25)*params(22)/params(24)) - (params(16)*params(18)/params(24)*(y(18)+y(20))+params(11)/params(12)*y(17));
    residual(3) = (y(18)) - (params(3)*y(26)+params(4)*y(21));
    residual(4) = (y(28)) - (y(46)+y(23)-y(39));
    residual(5) = (y(23)) - (y(26)*(-(params(3)+params(6)))+y(21)*T(1));
    residual(6) = (y(18)) - (y(22)+y(32)-params(13)*y(19));
    residual(7) = (y(17)) - (y(22)*params(20)*(params(13)-1)-(1+params(20)*(params(13)-1))*y(27));
    residual(8) = (y(30)) - (y(46)*params(1)+y(22)*params(8)*params(20)/params(9));
    residual(9) = (y(28)) - (y(30)*params(7)-y(31));
    residual(10) = (y(29)) - (y(28)-y(46));
    residual(11) = (y(24)) - (y(25)*params(12)*params(22)/params(21)+y(26)*(1-params(12))*params(23)/params(21));
    residual(12) = (y(19)) - (y(20)*params(12)*params(18)/params(17)+y(21)*params(19)/params(17)*(1-params(12)));
    residual(13) = (y(27)) - (y(32)+(1-params(13))*y(19));
    residual(14) = (y(27)) - (y(24));
    residual(15) = (y(32)) - (params(14)*y(16)+x(1));
    residual(16) = (y(31)) - (params(15)*y(15)+x(2));
end
