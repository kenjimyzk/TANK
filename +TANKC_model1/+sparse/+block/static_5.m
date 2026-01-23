function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  T(2)=y(10)^params(3);
  T(3)=y(5)^params(4);
  residual(1)=(y(2))-(T(2)*T(3));
  T(4)=y(9)^params(3);
  T(5)=y(4)^params(4);
  residual(2)=(y(2))-(T(4)*T(5));
  T(6)=exp(y(16));
  residual(3)=(y(2))-((1-params(12))*y(6)*T(6)*y(3)^(-params(12)));
  T(7)=0.5*params(8)*(y(14)-1)^2;
  residual(4)=(y(1))-(y(11)-y(11)*T(7)-y(2)*y(3));
  residual(5)=(y(9))-(y(2)*y(4)+params(10)/params(11)*y(1));
  residual(6)=(y(8))-(y(9)*params(11)+y(10)*(1-params(11)));
  residual(7)=(y(3))-(y(4)*params(11)+y(5)*(1-params(11)));
  residual(8)=(y(11))-(T(6)*y(3)^(1-params(12)));
  residual(9)=(y(11))-(y(8));
if nargout > 3
    g1_v = NaN(26, 1);
g1_v(1)=(-(T(3)*getPowerDeriv(y(10),params(3),1)));
g1_v(2)=(-(1-params(11)));
g1_v(3)=(-(T(4)*getPowerDeriv(y(4),params(4),1)));
g1_v(4)=(-y(2));
g1_v(5)=(-params(11));
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=y(3);
g1_v(10)=(-y(4));
g1_v(11)=1;
g1_v(12)=(-(params(10)/params(11)));
g1_v(13)=(-(T(5)*getPowerDeriv(y(9),params(3),1)));
g1_v(14)=1;
g1_v(15)=(-params(11));
g1_v(16)=1;
g1_v(17)=(-1);
g1_v(18)=(-(T(2)*getPowerDeriv(y(5),params(4),1)));
g1_v(19)=(-(1-params(11)));
g1_v(20)=(-((1-params(12))*y(6)*T(6)*getPowerDeriv(y(3),(-params(12)),1)));
g1_v(21)=y(2);
g1_v(22)=1;
g1_v(23)=(-(T(6)*getPowerDeriv(y(3),1-params(12),1)));
g1_v(24)=(-(1-T(7)));
g1_v(25)=1;
g1_v(26)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
