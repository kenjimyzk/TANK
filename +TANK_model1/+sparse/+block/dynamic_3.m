function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(38)=log(y(21)/(steady_state(2)));
  y(37)=(y(20)-(steady_state(1)))/(steady_state(10));
  y(36)=log(y(22)/(steady_state(3)));
  y(35)=log(y(26)/(steady_state(7)));
  y(31)=y(30)/y(51);
end
