function separatedstr = separator(array,separator)
% Yields a string with a separator between each element of ARRAY
% The default separator is |
% AB May 99


if ~exist('separator'),
   separator = '|';
end
sx = [];
for q = 1:length(array),
   sx = [sx,num2str(array(q)),'|'];
end
sx = sx(1:end-1);
separatedstr = sx;
