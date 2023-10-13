function [minima] = oscillmin(vector)
% OSCILLMIN
% [minima] = oscillmin(vector)
% Yields indices where vector has zero derivative and negative 2nd derivative and is the absolute minimum between
% zero-xings of the vector
% With linear interpolation b/w sample points
% AB Jun 00
%
% See also OSCILLMAX

lm = localminwinterpol(vector);
zx = zero_xings(vector);

minima=[];
for i=1:2:length(zx)-2,
   lastpk=zx(i);
   nextpk=zx(i+2);
   lmsthiscycle = lm(find(lm>lastpk & lm<=nextpk));
   minima=[minima,min(lmsthiscycle)];
end

lastzx=0;
nextzx=zx(1);
lmsthiscycle = lm(find(lm>lastzx & lm<=nextzx));
minima=[min(lmsthiscycle),minima];

% Last cycle
lastzx=zx(end);
nextzx=length(vector);
lmsthiscycle = lm(find(lm>lastzx & lm<=nextzx));
minima=[minima,min(lmsthiscycle)];
