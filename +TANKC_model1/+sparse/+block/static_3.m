function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(1)-(params(1)*y(12)/y(14));
  T(1)=exp((-y(15)))*1/params(1);
  residual(2)=(y(12))-(T(1)*y(14)^params(6));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-(params(1)/y(14)));
g1_v(2)=1;
g1_v(3)=(-((-(params(1)*y(12)))/(y(14)*y(14))));
g1_v(4)=(-(T(1)*getPowerDeriv(y(14),params(6),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
