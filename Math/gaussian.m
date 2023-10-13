function gaussian=gaussian(x,variance)
% function gaussian=gaussian(x,variance)
% AB, Modified to normalize Jun 00
% x = [-n -(n-1) ... 0 1 2 ... n]
%
% Normalized to area 1
%
% See also DOG

% W/o normalizing, area tends to 1 as length(x) tends to infinite (.97 for 7)
% Large variances require large length(x) for area to be close to 1
% Very small variances would require more resolution than 1 bin, and so 
% are better represented by rescaling:
% variance of 1 mm (and using vectors where each bin represents 1 mm) is better 
% than a variance of 0.001 m (and using vectors for which every bin is 1 m)
% A std. dev. of 0.6 is the one optimally represented by a short x vector

gaussian=(1/sqrt(2*pi*variance))*exp(-x.^2/2/variance);

gaussian = gaussian/sum(gaussian); % normalization to area 1

% 1.96 std dev's leaves 5% outside incl. both sides
