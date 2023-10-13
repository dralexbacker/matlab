function lm = localmaxwinterpol(vector)
% function lm = localmaxwinterpol(vector)
% Yields indices where vector has zero derivative and negative 2nd derivative
% With linear interpolation b/w sample points
% AB
%
% See LOCALMAX, LOCALMIN, PEAKFIND

vector = detrend(vector,0);

d = diff(vector);

% To detect maxima that occupy adjacent bins with equal values
%vector = vector(1:end)&d; % converts values equal to their predecessor to 0
% make the repeated values into the midpoint b/w surrounding points
%d0i = find(d==0);
%vector(d0i+1)=0;
%squashedv = sparse(vector);

%j = 1;
%while (d0i+j)==0,
 % j = j+1;
%end
%vector([d0i]) = (vector([d0i]-1)+vector([d0i])+1)/2;


d2 = diff(d);
% Shift to account for d2 shorter than vector:
d2(2:end+1) = d2; 
d2(1) = 0;
d2(end+1) = 0;

zxe = zero_xings(d)+0.5; % exact zero-xings, -.5 compensates for diff
czxe = ceil(zxe);
zxr = zeros(size(d2));
zxr(czxe) = 1; 
zxeind(czxe) = 1:length(zxe);
lm = zxe(zxeind(find(zxr & d2<0)));



