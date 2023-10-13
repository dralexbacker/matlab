function rows=findrows(matrix,row)
% FINDROWS - Returns line numbers of MATRIX which are equal to ROW
% AB Feb 02
% rows=findrows(matrix,row)

rows=1:size(matrix,1);
for col=1:length(row),
    lines=find(matrix(:,col)==row(col));
    rows=intersect(lines,rows);
    if isempty(rows),
        break
    end
end
