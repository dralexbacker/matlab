function mcv = maxcommonval(data,minfreq,nbins)
% function mcv = maxcommonval(data,minfreq,nbins)
% Yields value of center of maximum bin of hist(DATA,NBINS) with frequency higher than MINFREQ
% Default NBINS = 1/MINFREQ
% Not cumulative
% AB Jan 2000, Jul 2000

if ~exist('nbins','var'),
   nbins = 1/minfreq;
end

[n,pos] = hist(data,nbins);
mcv = pos(max(find(n>minfreq*length(data))));
