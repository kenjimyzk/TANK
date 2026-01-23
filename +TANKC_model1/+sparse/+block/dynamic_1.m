function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(36)=params(13)*y(16)+x(1);
  y(35)=params(14)*y(15)+x(2);
end
