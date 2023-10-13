function seqpos=find1stincell(celda,lookfor)
% FIND1stinCELL - Find for cells
% AB Jan 02
% Returns first position of the found element if found, zero if not found
% seqpos=findcell(celda,lookfor)

s=size(celda);
ls=length(s);

% Exploit fact that you can go through all elements of a cell first vertically varying along 1st dim, then 2nd column, etc.:
numcels=prod(s);
seqpos=0;
for i=1:numcels,
    if isequal(celda{i},lookfor),
        seqpos=i;
        %for dim=1:ls,
        %pos(dim)=rem(seqpos,s(1...))
        %end
        break
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