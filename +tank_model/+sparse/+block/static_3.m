function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(4))-(y(2)*params(11)+y(1)*(1-params(11)));
  residual(2)=(y(9))-(y(3)*(-params(4))+y(8));
  residual(3)=(y(3))-(y(1)*params(3)+y(9)*params(4));
  residual(4)=(y(5))-(params(1)*y(5)+(params(3)+params(4))/params(5)*(y(4)-y(9)));
  residual(5)=(y(6))-(y(5)*params(6)+y(4)*params(7)+x(2));
  residual(6)=(y(1))-(y(1)*params(1)-1/params(3)*(y(6)-y(5)-params(8)*y(7)));
  residual(7)=(y(2))-(y(3)+y(9));
if nargout > 3
    g1_v = NaN(20, 1);
g1_v(1)=1;
g1_v(2)=(-((params(3)+params(4))/params(5)));
g1_v(3)=(-params(7));
g1_v(4)=params(4);
g1_v(5)=1;
g1_v(6)=(-1);
g1_v(7)=(-(1-params(11)));
g1_v(8)=(-params(3));
g1_v(9)=1-params(1);
g1_v(10)=1;
g1_v(11)=(-params(4));
g1_v(12)=(params(3)+params(4))/params(5);
g1_v(13)=(-1);
g1_v(14)=1-params(1);
g1_v(15)=(-params(6));
g1_v(16)=(-(1/params(3)));
g1_v(17)=1;
g1_v(18)=1/params(3);
g1_v(19)=(-params(11));
g1_v(20)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
