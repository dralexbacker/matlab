function matrix = unzero(matrix)

% UNZERO
% minepsmatrix = unzero(matrix)
% Eliminates zeroes from matrix, replacing them with epsilon
% AB March 98

matrix(logical(matrix==0)) = eps;

% or
%zeroentries = (matrix==0);
%matrix = matrix + eps*zeroentries;
