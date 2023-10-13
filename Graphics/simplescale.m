function [gains,offsets,yscale] = scale(tracematrix,ratios)
% SIMPLESCALE - Yields gains & offsets & Y-scale to plot traces in each line of TRACEMATRIX
% such that they are not superimposed and have relative height ratios of RATIOS
% Uses these to plot the traces
% AB Aug 99

[numtr,trlen] = size(tracematrix);
tracematrix = tracematrix';
maximos = max(tracematrix);
minimos = min(tracematrix);
difs = maximos-minimos;
gains = ratios./difs; % Normalizes all ranges to ratios

for i = 1:numtr,
  offsets(i) = sum(ratios(2:i));%+numtr-i
  printmatrix(:,i) = (tracematrix(:,i)-minimos(i))*gains(i)-offsets(i);
end
plot(printmatrix)
yscale = [1-sum(ratios) 3.05]; % chged 1 to 1.05 to avoid data touching borders
                               % 3.05 allows 2 for phase plot
axis([[1 trlen],yscale])

% offsets set for no superimposition


