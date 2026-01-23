function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = TANKC_model2.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(43, 1);
g1_v(1)=(-(params(11)/params(12)));
g1_v(2)=1;
g1_v(3)=1;
g1_v(4)=(-(params(16)*params(18)/params(24)));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=params(13);
g1_v(8)=1;
g1_v(9)=(-(1-params(13)));
g1_v(10)=(-params(4));
g1_v(11)=(-(params(16)*params(18)/params(24)));
g1_v(12)=(-(params(12)*params(18)/params(17)));
g1_v(13)=(-params(4));
g1_v(14)=(-T(1));
g1_v(15)=(-(params(19)/params(17)*(1-params(12))));
g1_v(16)=(-1);
g1_v(17)=(-(params(20)*(params(13)-1)));
g1_v(18)=(-(params(8)*params(20)/params(9)));
g1_v(19)=1;
g1_v(20)=1;
g1_v(21)=(-1);
g1_v(22)=(-params(3));
g1_v(23)=params(22)/params(24);
g1_v(24)=(-(params(12)*params(22)/params(21)));
g1_v(25)=(-params(3));
g1_v(26)=params(3)+params(6);
g1_v(27)=(-((1-params(12))*params(23)/params(21)));
g1_v(28)=1+params(20)*(params(13)-1);
g1_v(29)=1;
g1_v(30)=1;
g1_v(31)=1;
g1_v(32)=1;
g1_v(33)=(-1);
g1_v(34)=1;
g1_v(35)=(-1);
g1_v(36)=1-params(1);
g1_v(37)=(-params(7));
g1_v(38)=1;
g1_v(39)=1;
g1_v(40)=1-params(15);
g1_v(41)=(-1);
g1_v(42)=(-1);
g1_v(43)=1-params(14);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 16, 16);
end
