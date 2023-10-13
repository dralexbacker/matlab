function [index,content] = firstnonempty(cell)
%function [index,content] = firstnonempty(cell)
% Yields first non-empty cell bin for a 1-DIM cell
% AB Nov 99

if min(size(cell))>1,
  error('FIRSTNONEMPTY.M: Cell must be one-dimensional.')
end

i=1;
while i<=length(cell) & isempty(cell{i}),
  i = i+1;
end
if i == length(cell)+1,
  index = [];
  content = [];
else,
  index = i;
  content = cell{i};
end

