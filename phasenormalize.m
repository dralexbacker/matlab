function phase = phasenormalize(phase,lolim,hilim)
% function phase = phasenormalize(phase,lolim,hilim)
% Normalizes PHASE vector to the (lolim hilim] interval as long as hilim-lolim>=2 pi
% Interval is [0 2pi) by default
% AB Apr 2000
%
% See also UNWRAP, PHASEINTERV
% UNWRAP does not normalize all phases to the [-pi pi] interval

outofrange = find(floor(phase/2*pi));
phase(outofrange) = mod(phase(outofrange),2*pi);

if exist('hilim','var') & ~isempty(hilim),
  pastmax = find(phase>hilim);
  while pastmax,
     phase(pastmax) = phase(pastmax)-2*pi;
     pastmax = find(phase>hilim);
  end
end
if exist('lolim','var') & ~isempty(lolim),
  pastmax = find(phase<=lolim);
  while pastmax,
     phase(pastmax) = phase(pastmax)+2*pi;
     pastmax = find(phase<=lolim);
  end
end
