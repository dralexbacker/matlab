function dolog(x,variance)
% DOLOG - Derivative Of Log Of Gaussian
%
% See also GAUSSIAN, DOG

%gaussian=(1/sqrt(2*pi*variance))*exp(-x.^2/2/variance);
%logg=log(gaussian);
dolog=log((1/sqrt(2*pi*variance)))* -x/variance;

%gaussian = gaussian/sum(gaussian); % normalization to area 1
