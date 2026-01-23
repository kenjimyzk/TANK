function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  y(18)=y(19)*params(10)*params(16)/params(15)+y(20)*(1-params(10))*params(17)/params(15);
  y(25)=y(30)+y(18)*(1-params(11));
  y(17)=y(21)+y(30)-params(11)*y(18);
  y(16)=y(21)*(params(11)-1)*params(18)+(1+(params(11)-1)*params(18))*y(25);
  residual(1)=(y(17))-(params(3)*y(24)+params(4)*y(20));
  residual(2)=(y(26))-(y(43)+params(3)*(y(39)-y(24)));
  residual(3)=(y(28))-(y(43)*params(1)+y(21)*params(18)*params(6)/params(7));
  residual(4)=(y(23)*params(20)/params(22))-(params(14)*params(16)/params(22)*(y(17)+y(19))+params(9)/params(10)*y(16));
  residual(5)=(y(25))-(y(22));
  residual(6)=(y(17))-(params(3)*y(23)+params(4)*y(19));
  residual(7)=(y(26))-(y(28)*params(5)-y(29));
  residual(8)=(y(22))-(y(23)*params(10)*params(20)/params(19)+y(24)*(1-params(10))*params(21)/params(19));
if nargout > 3
    g1_v = NaN(24, 1);
g1_v(1)=(-(params(11)*(1-params(10))*params(17)/params(15)))-params(4);
g1_v(2)=(-(params(14)*params(16)/params(22)*(-(params(11)*(1-params(10))*params(17)/params(15)))+params(9)/params(10)*(1+(params(11)-1)*params(18))*(1-params(10))*params(17)/params(15)*(1-params(11))));
g1_v(3)=(1-params(10))*params(17)/params(15)*(1-params(11));
g1_v(4)=(-(params(11)*(1-params(10))*params(17)/params(15)));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-(params(18)*params(6)/params(7)));
g1_v(9)=(-(params(14)*params(16)/params(22)+params(9)/params(10)*(params(11)-1)*params(18)));
g1_v(10)=1;
g1_v(11)=params(20)/params(22);
g1_v(12)=(-params(3));
g1_v(13)=(-(params(10)*params(20)/params(19)));
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=(-(params(11)*params(10)*params(16)/params(15)));
g1_v(17)=(-(params(14)*params(16)/params(22)*(1-params(11)*params(10)*params(16)/params(15))+params(9)/params(10)*(1+(params(11)-1)*params(18))*params(10)*params(16)/params(15)*(1-params(11))));
g1_v(18)=params(10)*params(16)/params(15)*(1-params(11));
g1_v(19)=(-(params(11)*params(10)*params(16)/params(15)))-params(4);
g1_v(20)=1;
g1_v(21)=(-params(5));
g1_v(22)=(-params(3));
g1_v(23)=params(3);
g1_v(24)=(-((1-params(10))*params(21)/params(19)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
end
