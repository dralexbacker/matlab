function subi=subindices(x,v)
% Returns vector with subindices of X where (last instance of) each value in V is found
% AB Apr 02

% Works fast for small values in X, otherwise implement a loop

location(x)=1:length(x);
subi=location(v);

