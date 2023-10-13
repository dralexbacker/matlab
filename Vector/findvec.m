function startpos=findvec(x,y)
%  FINDVEC Find one vector within another.
%     K = FINDVEC(S1,S2) returns the starting indices of any occurrences
%     of the shorter of the two vectors in the longer.
%     Returns zero if S2 is not found in S1  
%
%     FINDSTR is symmetric in its two arguments; that is, either
%     S1 or S2 may be the shorter pattern to be searched for in the longer
%     vector. 
%  AB Dec 2005

% if min(size(x))>1 | min(size(y))>1,
%     error('FINDVEC is for vectors, not matrices')
% end
% if size(x,2)>1,
%     x=x';
% end
% if size(y,1)>1,
%     y=y';
% end
 startpos=0;
 lx=length(x);
 ly=length(y);
% if ly<lx,
%     [x y]=swap(x,y);
%     [lx ly]=swap(lx,ly);
% end

for i=1:lx-ly+1,
    if x(i:i+ly-1)==y,
        startpos=i;
        return;
    end
end
