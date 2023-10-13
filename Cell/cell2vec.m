function vector = cell2vec(celda)
% Converts 1-dim cell CELDA into a 1-dimensional vector with all the elements in CELDA
% AB Apr 2000
%
% This concatenates, to create a cell with each element in a different
% subindex, use CELL2ARRAY
% See also CELL2VECWID

vector = []; % put all trials in one vector
for tr = 1:length(celda),
   vector = [vector,celda{tr}];
end
