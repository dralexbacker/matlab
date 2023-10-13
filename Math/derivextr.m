function [derivmin,derivmax] = derivextr(vector);

% DERIVEXTR
% 	Yields extremes of the approximate derivative of vector
% AB Mar 98

derivmin = find(diff(vector)==min(diff(vector)));
derivmax = find(diff(vector)==max(diff(vector)));
