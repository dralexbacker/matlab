function [odor] = postslash(filename)

% FILETOODOR - Filename to odorname
% function [odor] = postslash(filename)
% AB Jul 99
%
% Yields part of filename after last slash

sf = size(filename,2);
slashpos = find(filename == '/');
if isempty(slashpos),
   slashpos = find(filename == '\');
end
s = max(size(slashpos)); 
slash1 = slashpos(s);	% Last slash
odor = filename(slash1+1:sf);	% After last slash
