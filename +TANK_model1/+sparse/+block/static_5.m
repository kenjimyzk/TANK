function [y, T, residual, g1] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  T(2)=y(9)^params(3);
  T(3)=y(5)^params(4);
  residual(1)=(y(2))-(T(2)*T(3));
  T(4)=exp(y(15));
  residual(2)=(y(2))-((1-params(11))*y(6)*T(4)*y(3)^(-params(11)));
  T(5)=0.5*params(7)*(y(13)-1)^2;
  residual(3)=(y(1))-(y(10)-y(10)*T(5)-y(2)*y(3));
  residual(4)=(y(8))-(y(2)*y(4)+params(9)/params(10)*y(1));
  residual(5)=(y(7))-(y(8)*params(10)+y(9)*(1-params(10)));
  residual(6)=(y(3))-(y(4)*params(10)+y(5)*(1-params(10)));
  residual(7)=(y(10))-(T(4)*y(3)^(1-params(11)));
  residual(8)=(y(10))-(y(7));
  T(6)=y(8)^params(3);
  T(7)=y(4)^params(4);
  residual(9)=(y(2))-(T(6)*T(7));
if nargout > 3
    g1_v = NaN(26, 1);
g1_v(1)=(-(T(3)*getPowerDeriv(y(9),params(3),1)));
g1_v(2)=(-(1-params(10)));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=y(3);
g1_v(6)=(-y(4));
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-(params(9)/params(10)));
g1_v(10)=1;
g1_v(11)=(-params(10));
g1_v(12)=(-(T(7)*getPowerDeriv(y(8),params(3),1)));
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=(-(T(2)*getPowerDeriv(y(5),params(4),1)));
g1_v(16)=(-(1-params(10)));
g1_v(17)=(-((1-params(11))*y(6)*T(4)*getPowerDeriv(y(3),(-params(11)),1)));
g1_v(18)=y(2);
g1_v(19)=1;
g1_v(20)=(-(T(4)*getPowerDeriv(y(3),1-params(11),1)));
g1_v(21)=(-(1-T(5)));
g1_v(22)=1;
g1_v(23)=1;
g1_v(24)=(-y(2));
g1_v(25)=(-params(10));
g1_v(26)=(-(T(6)*getPowerDeriv(y(4),params(4),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
