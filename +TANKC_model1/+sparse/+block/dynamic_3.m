function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(40)=log(y(22)/(steady_state(2)));
  y(39)=(y(21)-(steady_state(1)))/(steady_state(11));
  y(38)=log(y(23)/(steady_state(3)));
  y(37)=log(y(28)/(steady_state(8)));
  y(33)=y(32)/y(54);
end
