function mn = MEDIANcell(celda)
% MEDIANCELL
% Yields median of elements in each element of CELDA
% function mn = mediancell(celda)
% 
% AB 2/02
%
% See also SUMCELL, MEANCELL, SDCELL, SECELL

if min(size(celda))>1,
  error('MEDIANCELL can only accept linear cells at this time')
end

for i=1:length(celda),
    mn(i)=median(celda{i});
end
