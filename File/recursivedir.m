functionnames=recursivedir(ext2use);
% RECURSIVEDIR - Recursive directory list
% AB Apr 03
%
% Optional EXT2USE argument specifies extension to use (default: all)
% Yields a cell, each element of which is a filename

if nargin<1,
    ext2use='*'; % all
end

functionnames=findfunctions(functionnames,ext2use);

function functionnames=findfunctions(functionnames,ext2use)
% Find all function names:
d=dir;
nf=length(d);
for i=3:nf,
    if d(i).isdir,
        cd(d(i).name)
        functionnames=findfunctions(functionnames,ext2use);
        cd ..
    else,
        [name,ext]=extension(d(i).name);
        if (isequal(ext,'*') | isequal(ext,ext2use)) & ~inlist(name,functionnames),
            functionnames{end+1}=d(i).name;
        end
    end
end

