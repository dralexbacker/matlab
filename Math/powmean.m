function powmean = powmean(vector,z)
% POWMEAN - Computes the geometric average of the elements of vector
% 		by computing the average after transforming each by a power law 
%		with exponent z, and then taking the z'th root
% function powmean = powmean(vector,z)
% AB 12/4/97
%
% See GEOMAVG for a more sophisticated version that avoids pitfalls with zeros

powmean=geomavg(vector,z);
%powmean = mean(vector.^z)^(1/z);
