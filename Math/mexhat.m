function filtered = mexhat(matrix)
% MEXHAT
% AB May 97 
%		Applies a Mexican hat shaped filter of a 3 pixel
%		horizontal kernel: [-factor 1 -factor]
%		Assumes edge values to be continued identically
%		outside the matrix, to avoid edge effects

factor = .5;

s = size(matrix);
l = s(2);

for line = 1:s(1),
  vector = matrix(line,:);
  filtered(line,:) = vector - factor*[vector(1),vector(1:l-1)] - factor*[vector(2:l),vector(l)];
end
