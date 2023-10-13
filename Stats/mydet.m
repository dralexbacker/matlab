function d=mydet(matrix)
% matrix square determinant
% AB Aug 99

if size(matrix)==[1 1],
  d = matrix;
else,
  allcols = 1:size(matrix,1);
d = 0;
rows = 2:size(matrix,1);
for i = allcols,
  cols = find(allcols~=i);
  d = d+matrix(1,i)*mydet(matrix(rows,cols))*(-1)^(1-rem(i,2));
end
end
