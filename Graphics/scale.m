function [gains,offsets,yscale] = scale(tracematrix,ratios,oldgains,spikeless,phasegain)
% SCALE - Yields gains & offsets & Y-scale to plot traces in each line of TRACEMATRIX 
% such that they are not superimposed and have relative height ratios of RATIOS
% Uses these to plot the traces in TRACEMATRIX
% AB Aug 99
%
% See also SIMPLESCALE

[numtr,trlen] = size(tracematrix); % [# of traces, trace length]
tracematrix = tracematrix';
maximos = max(tracematrix);
minimos = min(tracematrix);
difs = maximos-minimos;
gains = ratios./difs; % Normalizes all ranges to ratios

if spikeless & oldgains~= [1 1 1 1],
   gains = oldgains; % Use previous trial's scalebars if no spikes
end

for i = 1:numtr,
  offsets(i) = sum(ratios(2:i)); % ratios(1,:) goes up from 0 so it's excluded
%  offsets(i) = sum(ratios(1:i-1)); 
% this 'd be it if 1st trace went bottom & it said +offsets(i) below
  printmatrix(:,i) = (tracematrix(:,i)-minimos(i))*gains(i)-offsets(i);
end
plot(printmatrix)
yscale = [ratios(1)-sum(ratios) 2*phasegain+1.05*ratios(1)]; % 1.05 to avoid data touching borders
                               % 2*phasegain allows for phase plot
axis([[1 trlen],yscale])

% offsets set for no superimposition


