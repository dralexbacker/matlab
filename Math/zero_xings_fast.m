function ZX=zero_xings_fast(x);
% ZERO_XINGS_FAST - Faster version of ZERO_XINGS, finds zero crossings of X
% function ZX=zero_xings_fast(x);
% AB Mar 2002
% ZX is a row list of the zero-crossings
% of x, linearly interpolated.
% use on bandpassed field potentials
% returns ZX values in samples (or fractions of samples).
% Fixed 2 bugs present in mikezero_xings.m: interpolation now right and
% passing through zero allowed now
% 
% See also ZERO_XINGS, ZXINGS, FALZXINGS, RISZERO_XINGS, FALZERO_XINGS
% 
% If x stays at zero for several values before changing signs, this will return
% the point after the string of zeros. 

% If this is not desired, keep track of last pre-zero value and interpolate in 
% b/w current return and that

if ~x(1) & isempty(find(x)),
     error('X does not have any non-zero element.')
end

s=sign(x);
d=diff(s);
a=abs(d);
i=find(a==2);
ZX=i; % -1 for sample before and +1 for diff cancel ea other out
ZX=ZX+abs(x(i))./(abs(x(i))+abs(x(i+1))); % linear interpolation
