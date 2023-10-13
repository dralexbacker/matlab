function mat = cell2matab(celda)
% CELL2MAT - Converts 1-dim celda of size nx1 into a 1-dim matrix of size(n,m) where m=max length of celda's elements
% function mat = cell2mat(celda)
%
% Empty elements are returned as lines with zeros

%width=0;
%for i=1:length(celda),
%   if length(celda{i})>width,
%      width=length(celda{i});
%   end
%end

for i=1:length(celda),
    if ~isempty(celda{i}),
       mat(i,1:length(celda{i})) = celda{i};
   end
end
