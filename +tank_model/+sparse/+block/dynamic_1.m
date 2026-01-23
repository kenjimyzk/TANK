function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(16)=params(8)*y(7)+x(1);
  y(17)=params(10)*y(8)+x(3);
end
