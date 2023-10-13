function [peaks] = relmax(thevect)
%peaks is a row list of the peaks & troughs
%of x, linearly interpolated between samples.
%use on bandpassed field potentials
%returns peak values in samples (or fractions of samples).
%%new version of Miketools/peakfind.m, itself a remaker of oldpeakfind.m 8-10-95
% AB Apr 10 2000
%
% See LOCALMAX, LOCALMIN

peaks = zero_xings(diff(thevect));
peaks = peaks+0.5; % compensates for offset of diff

