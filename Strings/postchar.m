function [odor] = postchar(filename,char)
% POSTCHAR - Yields part of filename after last occurrence of CHAR
% function [odor] = postchar(filename,char)
% AB Apr 03
% If CHAR not present in FILENAME, yields empty string

sf = size(filename,2);
slashpos = find(filename == char);
if isempty(slashpos),
   odor=[];
   return;
end
s = max(size(slashpos)); 
slash1 = slashpos(s);	% Last slash
odor = filename(slash1+1:sf);	% After last slash
