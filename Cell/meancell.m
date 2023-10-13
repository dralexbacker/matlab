function mn = MEANcell(celda)
% MEANCELL
% Yields mean of elements in each element of CELDA
% function mn = meancell(celda)
% 
% AB 2/02
%
% See also SUMCELL

if min(size(celda))>1,
  error('MEANCELL can only accept linear cells at this time')
end

for i=1:length(celda),
    mn(i)=mean(celda{i});
end
