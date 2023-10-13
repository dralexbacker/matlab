function [suma,sumpercelelem] = smoothsumcell(celda,range,sde)
% SMOOTHSUMCELL - Just as SUMCELL but smooths at the edges with a gaussian of stdev SDE
% function [suma,sumpercelelem] = smoothsumcell(celda,range,sde)
% Yields quantity of elements within RANGE (1x2 vector of [LO HI]) in each
% cell element (SUMPERCELELEM) & the sum across the whole cell (SUMA)
% If RANGE is ommitted, the sum will be done over all numbers (Default RANGE=[-Inf Inf])
% Should be a lot faster than smoothing the whole spiketime when all you're interested is in a sum over windows
% 
% AB Aug 00

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
	hlk=3*ceil(sde); % half (length of kernel -1)
	for i = 1:length(celda),
  		sumpercelelem(i) = length(find(celda{i}>rangelo+hlk & celda{i}<rangehi-hlk));
	end
	edgesum=0;
	for i = 1:length(celda),
      ledgeraster=st2raster(celda{i}(find(celda{i}>=rangelo-hlk & celda{i}<=rangelo+hlk)),rangelo+hlk);
      ledgeraster=[zeros(1,2*hlk+1),ledgeraster];
      ledgeraster=ledgeraster(end-2*hlk:end);
   	smler=smooth(ledgeraster,sde); % smooth left edge raster
   	edgesum=edgesum+sum(smler(hlk+1:end));
      redgeraster=st2raster(celda{i}(find(celda{i}>=rangehi-hlk & celda{i}<=rangehi+hlk)),rangehi+hlk);
      redgeraster=[zeros(1,2*hlk+1),redgeraster];
      redgeraster=redgeraster(end-(2*hlk):end-hlk);
   	smrer=smooth(redgeraster,sde); % smooth right edge raster
   	edgesum=edgesum+sum(smrer(1:hlk));
	end
end
suma = sum(sumpercelelem)+edgesum;
