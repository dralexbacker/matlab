function path = preslash(path)
% PRESLASH - Yields part of PATH before last slash
% function path = preslash(path)
% AB Dec 08
% Returns empty string if no slash

slash='/';
sf = size(path,2);
slashpos = find(path == slash);
if isempty(slashpos),
    path='';
    return;
end
s = max(size(slashpos)); 
slash1 = slashpos(s);	% Last slash
path=path(1:slash1-1);
