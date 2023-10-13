function lm = localminwinterpol(vector)
% function lm = localminwinterpol(vector)
% Yields indices where vector has zero derivative and positive 2nd derivative
% With linear interpolation b/w sample points
% AB
%
% See LOCALMAXWINTERPOL, LOCALMAX, LOCALMIN, PEAKFIND

vector = detrend(vector,0);

d = diff(vector);

d2 = diff(d);
% Shift to account for d2 shorter than vector:
d2(2:end+1) = d2; 
d2(1) = 0;
d2(end+1) = 0;

zxe = zero_xings(d)+0.5; % exact zero-xings, +.5 compensates for diff
czxe = ceil(zxe);
zxr = zeros(size(d2));
zxr(czxe) = 1; 
zxeind(czxe) = 1:length(zxe);
lm = zxe(zxeind(find(zxr & d2>0)));



