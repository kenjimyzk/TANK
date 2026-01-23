function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = TANK_model2.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(40, 1);
g1_v(1)=(-(params(9)/params(10)));
g1_v(2)=1;
g1_v(3)=1;
g1_v(4)=(-(params(14)*params(16)/params(22)));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=params(11);
g1_v(8)=1;
g1_v(9)=(-(1-params(11)));
g1_v(10)=(-params(4));
g1_v(11)=(-(params(14)*params(16)/params(22)));
g1_v(12)=(-(params(10)*params(16)/params(15)));
g1_v(13)=(-params(4));
g1_v(14)=(-((1-params(10))*params(17)/params(15)));
g1_v(15)=(-1);
g1_v(16)=(-((params(11)-1)*params(18)));
g1_v(17)=(-(params(18)*params(6)/params(7)));
g1_v(18)=1;
g1_v(19)=(-1);
g1_v(20)=(-params(3));
g1_v(21)=params(20)/params(22);
g1_v(22)=(-(params(10)*params(20)/params(19)));
g1_v(23)=(-params(3));
g1_v(24)=(-((1-params(10))*params(21)/params(19)));
g1_v(25)=(-(1+(params(11)-1)*params(18)));
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=1;
g1_v(29)=1;
g1_v(30)=(-1);
g1_v(31)=1;
g1_v(32)=(-1);
g1_v(33)=1-params(1);
g1_v(34)=(-params(5));
g1_v(35)=1;
g1_v(36)=1;
g1_v(37)=1-params(13);
g1_v(38)=(-1);
g1_v(39)=(-1);
g1_v(40)=1-params(12);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 15, 15);
end
