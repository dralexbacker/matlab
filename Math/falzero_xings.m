function ZX=falzero_xings(x);
% function ZX=falzero_xings(x);
%ZX is a row list of the falling zero-crossings of x, linearly interpolated.
%use on bandpassed field potentials
%returns ZX values in samples (or fractions of samples).
% MSW, AB 2000
%
% See ZERO_XINGS, ZXINGS, RISZERO_XINGS


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
                if sign(x(i))==-1,
			ZX(a)=	i-1;
                        ZX(a)= ZX(a)+ abs(x(i-1)) /(abs(x(i-1))+abs(x(i))); % linear interpolation
			a=a+1;
                end % if sign==1
	end %if
end %for i


