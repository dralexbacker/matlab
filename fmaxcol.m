function col = fmaxcol(X)
% FMAXCOL
% AB May 97
%		Finds index of column with maximum sum in matrix X

[val,col] = max(sum(X));
