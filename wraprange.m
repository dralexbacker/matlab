function [ind,values] = wraprange(vector,lo,hi)
% WRAPRANGE - Yields indices & values of vector(lo:hi) allowing lo & hi to wrap around 
% (ie. lo may be <=0, hi may be >=length(vector))
% function [ind,values] = wraprange(vector,lo,hi)
% AB Aug 00

if lo<1 & hi>length(vector),
   ind=[length(vector)+lo:length(vector),1:hi,1:hi-length(vector)];
elseif lo<1,
   ind=[length(vector)+lo:length(vector),1:hi];
elseif hi>length(vector);
	ind=[lo:length(vector),1:hi-length(vector)];
else,
    ind=lo:hi;
end
values=vector(ind);
