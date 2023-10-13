function [maxima] = oscillmax(vector)
% OSCILLMAX
% [maxima] = oscillmax(vector)
% Yields indices where vector has zero derivative and negative 2nd derivative and is the absolute maximum between
% zero-xings of the vector
% With linear interpolation b/w sample points
% AB Jun 00
% 
% See also OSCILLMIN

lm = localmaxwinterpol(vector);
zx = zero_xings(vector);

maxima=[];
for i=1:2:length(zx)-2,
   lastzx=zx(i);
   nextzx=zx(i+2);
   lmsthiscycle = lm(find(lm>lastzx & lm<=nextzx));
   maxima=[maxima,max(lmsthiscycle)];
end

% 1st cycle
lastzx=0;
nextzx=zx(1);
lmsthiscycle = lm(find(lm>lastzx & lm<=nextzx));
maxima=[max(lmsthiscycle),maxima];

% Last cycle
lastzx=zx(end);
nextzx=length(vector);
lmsthiscycle = lm(find(lm>lastzx & lm<=nextzx));
maxima=[maxima,max(lmsthiscycle)];
