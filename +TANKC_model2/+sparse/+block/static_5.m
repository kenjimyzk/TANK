function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  residual(1)=(y(2))-(params(3)*y(10)+params(4)*y(5));
  residual(2)=(y(9)*params(22)/params(24))-(params(16)*params(18)/params(24)*(y(2)+y(4))+params(11)/params(12)*y(1));
  residual(3)=(y(2))-(y(6)+y(16)-params(13)*y(3));
  residual(4)=(y(1))-(y(6)*params(20)*(params(13)-1)-(1+params(20)*(params(13)-1))*y(11));
  residual(5)=(y(2))-(params(3)*y(9)+params(4)*y(4));
  residual(6)=(y(8))-(y(9)*params(12)*params(22)/params(21)+y(10)*(1-params(12))*params(23)/params(21));
  residual(7)=(y(3))-(y(4)*params(12)*params(18)/params(17)+y(5)*params(19)/params(17)*(1-params(12)));
  residual(8)=(y(11))-(y(16)+(1-params(13))*y(3));
  residual(9)=(y(11))-(y(8));
if nargout > 3
    g1_v = NaN(24, 1);
g1_v(1)=(-params(4));
g1_v(2)=(-(params(19)/params(17)*(1-params(12))));
g1_v(3)=params(22)/params(24);
g1_v(4)=(-params(3));
g1_v(5)=(-(params(12)*params(22)/params(21)));
g1_v(6)=1;
g1_v(7)=(-(params(16)*params(18)/params(24)));
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(-(params(11)/params(12)));
g1_v(11)=1;
g1_v(12)=(-(params(16)*params(18)/params(24)));
g1_v(13)=(-params(4));
g1_v(14)=(-(params(12)*params(18)/params(17)));
g1_v(15)=(-params(3));
g1_v(16)=(-((1-params(12))*params(23)/params(21)));
g1_v(17)=params(13);
g1_v(18)=1;
g1_v(19)=(-(1-params(13)));
g1_v(20)=1+params(20)*(params(13)-1);
g1_v(21)=1;
g1_v(22)=1;
g1_v(23)=1;
g1_v(24)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
