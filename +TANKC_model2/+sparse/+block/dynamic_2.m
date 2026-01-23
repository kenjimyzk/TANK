function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  y(19)=y(20)*params(12)*params(18)/params(17)+y(21)*params(19)/params(17)*(1-params(12));
  y(27)=y(32)+(1-params(13))*y(19);
  y(18)=y(22)+y(32)-params(13)*y(19);
  y(17)=y(22)*params(20)*(params(13)-1)-(1+params(20)*(params(13)-1))*y(27);
  residual(1)=(y(18))-(params(3)*y(26)+params(4)*y(21));
  residual(2)=(y(28))-(y(46)+y(23)-y(39));
  residual(3)=(y(30))-(y(46)*params(1)+y(22)*params(8)*params(20)/params(9));
  residual(4)=(y(25)*params(22)/params(24))-(params(16)*params(18)/params(24)*(y(18)+y(20))+params(11)/params(12)*y(17));
  residual(5)=(y(24))-(y(25)*params(12)*params(22)/params(21)+y(26)*(1-params(12))*params(23)/params(21));
  residual(6)=(y(27))-(y(24));
  residual(7)=(y(18))-(params(3)*y(25)+params(4)*y(20));
  residual(8)=(y(23))-(y(26)*(-(params(3)+params(6)))+y(21)*params(6)*(1-params(13))*params(20)*params(19)/params(17)/(params(23)/params(24)));
  residual(9)=(y(28))-(y(30)*params(7)-y(31));
if nargout > 3
    g1_v = NaN(27, 1);
g1_v(1)=(-(params(13)*params(19)/params(17)*(1-params(12))))-params(4);
g1_v(2)=(-(params(16)*params(18)/params(24)*(-(params(13)*params(19)/params(17)*(1-params(12))))+params(11)/params(12)*(-((1+params(20)*(params(13)-1))*(1-params(13))*params(19)/params(17)*(1-params(12))))));
g1_v(3)=(1-params(13))*params(19)/params(17)*(1-params(12));
g1_v(4)=(-(params(13)*params(19)/params(17)*(1-params(12))));
g1_v(5)=(-(params(6)*(1-params(13))*params(20)*params(19)/params(17)/(params(23)/params(24))));
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-(params(8)*params(20)/params(9)));
g1_v(10)=(-(params(16)*params(18)/params(24)+params(11)/params(12)*params(20)*(params(13)-1)));
g1_v(11)=1;
g1_v(12)=params(22)/params(24);
g1_v(13)=(-(params(12)*params(22)/params(21)));
g1_v(14)=(-params(3));
g1_v(15)=(-params(3));
g1_v(16)=(-((1-params(12))*params(23)/params(21)));
g1_v(17)=params(3)+params(6);
g1_v(18)=1;
g1_v(19)=(-1);
g1_v(20)=(-(params(13)*params(12)*params(18)/params(17)));
g1_v(21)=(-(params(16)*params(18)/params(24)*(1-params(13)*params(12)*params(18)/params(17))+params(11)/params(12)*(-((1+params(20)*(params(13)-1))*(1-params(13))*params(12)*params(18)/params(17)))));
g1_v(22)=(1-params(13))*params(12)*params(18)/params(17);
g1_v(23)=(-(params(13)*params(12)*params(18)/params(17)))-params(4);
g1_v(24)=(-1);
g1_v(25)=1;
g1_v(26)=1;
g1_v(27)=(-params(7));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
