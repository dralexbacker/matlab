function [suma,sumpercelelem] = sumcell(celda,range,values)
% function [suma,sumpercelelem] = sumcell(celda,range,values)
% Yields quantity of elements within RANGE (1x2 vector of [LO HI]) in each
% cell element (SUMPERCELELEM) & the sum across the whole cell (SUMA)
% If RANGE is ommitted, number of all elements in celda that match one of the elements of VALUES will be computed
% If RANGE and VALUES are ommitted, the count will be done over all numbers (Default RANGE=[-Inf Inf])
% 
% AB 4/00
%
% See also MEANCELL

if min(size(celda))>1,
  error('SUMCELL can only accept linear cells at this time')
end
if ~exist('range','var') | isempty(range),
   if ~exist('values','var') | isempty(values),
      	rangelo = -Inf;
       rangehi = Inf;
   else, 		% Use VALUES      
   		for i = 1:length(celda),
            sumpercelelem(i) = Nshared(celda{i},values);
       end
   end    
else,
   rangelo = range(1);
   rangehi = range(2);
	if rangelo>rangehi,
  		error('RANGE(2) must be larger than or equal to RANGE(1)')
	end
end

if ~exist('values','var') | isempty(values),
for i = 1:length(celda),
  sumpercelelem(i) = length(find(celda{i}>=rangelo & celda{i}<=rangehi));
end
end

suma = sum(sumpercelelem);
