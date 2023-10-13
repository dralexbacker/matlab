function seqpos=findcell(celda,lookfor)
% FINDCELL - Find for cells
% AB May 2020
% Returns all positions of the found element if found, zero if not found
% seqpos=findcell(celda,lookfor)
%
% See also FIND1stinCELL

% Not Exploiting fact that you can go through all elements of a cell first vertically varying along 1st dim, then 2nd column, etc.:
seqpos=[];
count=0;
for i=1:length(celda),
    if isequal(celda{i},lookfor),
        count=count+1;
        seqpos(count)=i;
    end
end

if 0, % Recursive unfinished method
    if ls==2 & any(s==1),
        % Uni-dimensional cell left
        len=max(s);
        for i=1:len,
            if isequal(celda{i},lookfor),
                seqpos=i;
                break
            end
        end
    else,
        % Multi-dimensional cell left
        lthisdim=s(1);
        for i=1:lthisdim,
            %celpiece=celda(i,:, :, ...)
            % ...
        end
    end
end