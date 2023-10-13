function ZX=zero_xings(x);
% function ZX=zero_xings(x);
%ZX is a row list of the zero-crossings
%of x, linearly interpolated.
%use on bandpassed field potentials
%returns ZX values in samples (or fractions of samples).
% MSW, AB 2000
% Fixed 2 bugs present in mikezero_xings.m: interpolation now right and
% passing through zero allowed now
% 
% See also ZERO_XINGS_FAST, ZXINGS, FALZXINGS, RISZERO_XINGS, FALZERO_XINGS
% 
% If x stays at zero for several values before changing signs, this will return
% the point after the string of zeros. 

% If this is not desired, keep track of last pre-zero value and interpolate in 
% b/w current return and that

ZX=zero_xings_fast(x); % Faster algorithm that yields exactly the same, April 2002
return;

if x(1),
  currsign = sign(x(1));
else, % if x(1)==0 use sign of 1st non-zero value of x
  if isempty(find(x)),
     error('X does not have any non-zero element.')
  else,
     currsign = sign(x(find(x)));
  end
  currsign = currsign(1);
end
a=1;
for i = 2:length(x)
	if sign(x(i))==-currsign,
            currsign = -currsign;
			ZX(a)=	i-1;
            ZX(a)= ZX(a)+ abs(x(i-1)) /(abs(x(i-1))+abs(x(i))); % linear interpolation
			a=a+1;
	end %if
end %for i


