function se = secell(celda)
% seCELL
% Yields std error of elements in each element of CELDA
% function se = secell(celda)
% 
% AB 2/02
%
% See also SUMCELL, MEANCELL, SDCELL

if min(size(celda))>1,
  error('SDCELL can only accept linear cells at this time')
end

for i=1:length(celda),
    se(i)=ste(celda{i});
end
