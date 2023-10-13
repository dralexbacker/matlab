function sd = sdcell(celda)
% sdCELL
% Yields std dev of elements in each element of CELDA
% function sd = sdcell(celda)
% 
% AB 2/02
%
% See also SUMCELL, MEANCELL

if min(size(celda))>1,
  error('SDCELL can only accept linear cells at this time')
end

for i=1:length(celda),
    sd(i)=std(celda{i});
end
