function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(30)=params(12)*y(15)+x(1);
  y(29)=params(13)*y(14)+x(2);
end
