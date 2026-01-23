function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  residual(1)=(y(2))-(params(3)*y(9)+params(4)*y(5));
  residual(2)=(y(2))-(y(6)+y(15)-params(11)*y(3));
  residual(3)=(y(1))-(y(6)*(params(11)-1)*params(18)+(1+(params(11)-1)*params(18))*y(10));
  residual(4)=(y(8)*params(20)/params(22))-(params(14)*params(16)/params(22)*(y(2)+y(4))+params(9)/params(10)*y(1));
  residual(5)=(y(7))-(y(8)*params(10)*params(20)/params(19)+y(9)*(1-params(10))*params(21)/params(19));
  residual(6)=(y(3))-(y(4)*params(10)*params(16)/params(15)+y(5)*(1-params(10))*params(17)/params(15));
  residual(7)=(y(10))-(y(15)+y(3)*(1-params(11)));
  residual(8)=(y(10))-(y(7));
  residual(9)=(y(2))-(params(3)*y(8)+params(4)*y(4));
if nargout > 3
    g1_v = NaN(24, 1);
g1_v(1)=(-params(3));
g1_v(2)=(-((1-params(10))*params(21)/params(19)));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-(params(14)*params(16)/params(22)));
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-(params(9)/params(10)));
g1_v(9)=params(20)/params(22);
g1_v(10)=(-(params(10)*params(20)/params(19)));
g1_v(11)=(-params(3));
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=(-params(4));
g1_v(15)=(-((1-params(10))*params(17)/params(15)));
g1_v(16)=params(11);
g1_v(17)=1;
g1_v(18)=(-(1-params(11)));
g1_v(19)=(-(1+(params(11)-1)*params(18)));
g1_v(20)=1;
g1_v(21)=1;
g1_v(22)=(-(params(14)*params(16)/params(22)));
g1_v(23)=(-(params(10)*params(16)/params(15)));
g1_v(24)=(-params(4));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
