function lines=anyreplines(mat)
% lines=ANYREPLINES(mat)
% Verifies if there are any identical consecutive lines in MAT
% AB Jun 01

lines=[];
numlines=size(mat,1)
for i=2:numlines,
    if all(mat(i,:)==mat(i-1,:)),
        lines=[lines,i];
    end
end

