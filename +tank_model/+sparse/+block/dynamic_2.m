function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  y(11)=y(12)+y(18);
  y(13)=y(11)*params(11)+y(10)*(1-params(11));
  residual(1)=(y(18))-(y(12)*(-params(4))+y(17));
  residual(2)=(y(14))-(params(1)*y(23)+(params(3)+params(4))/params(5)*(y(13)-y(18)));
  residual(3)=(y(10))-(params(1)*y(19)-1/params(3)*(y(15)-y(23)-params(8)*y(16)));
  residual(4)=(y(12))-(y(10)*params(3)+y(18)*params(4));
  residual(5)=(y(15))-(y(14)*params(6)+y(13)*params(7)+x(2));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=params(4);
g1_v(2)=(-(params(11)*(params(3)+params(4))/params(5)));
g1_v(3)=1;
g1_v(4)=(-(params(11)*params(7)));
g1_v(5)=1;
g1_v(6)=(-((params(3)+params(4))/params(5)*(params(11)-1)));
g1_v(7)=(-params(4));
g1_v(8)=(-(params(11)*params(7)));
g1_v(9)=1/params(3);
g1_v(10)=1;
g1_v(11)=(-((1-params(11))*(params(3)+params(4))/params(5)));
g1_v(12)=1;
g1_v(13)=(-params(3));
g1_v(14)=(-((1-params(11))*params(7)));
g1_v(15)=1;
g1_v(16)=(-params(6));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
