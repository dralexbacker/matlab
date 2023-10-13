function [vector,identity] = cell2vecwid(celda)
% function [vector,identity] = cell2vecwid(celda)
% Converts 1-dim cell CELDA into a 1-dimensional vector with all the elements in CELDA
% Identity has cell number corresponding to each element in vector
% AB Apr 2000
%
% See CELL2VEC

vector = []; % put all trials in one vector
prevl = 0;
for tr = 1:length(celda),
   vector = [vector,celda{tr}];
   identity(prevl+1:length(vector)) = tr;
   prevl = length(vector);
end
