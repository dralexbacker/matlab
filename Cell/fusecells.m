function fused=fusecells(c1,c2)
% FUSECELLS - Returns a cell, each element of which contains the corresponding element of c1 & that of c2 concatenated
% Copyright (c) 2002 Alex Backer

if min(size(c1))>1 |  min(size(c2))>1,
    error('FUSECELLS takes 1-dim cells only')
end

l1=length(c1);
l2=length(c2);
ml=max([l1 l2]);
for i=1:ml,
    if length(c1)>=i & length(c2)>=i & ~isempty(c1(i)) & ~isempty(c2(i)),
        fused{i}=[c1{i}(:);c2{i}(:)];
    elseif length(c1)>=i & ~isempty(c1(i)),
        fused{i}=[c1{i}(:)];
    elseif length(c2)>=i & ~isempty(c2(i)),
        fused{i}=[c2{i}(:)];
    else,
        fused{i}=[];
    end
end
