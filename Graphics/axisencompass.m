function axisencompass(x,y,factor)
% Makes current axis encompass min & max in X & Y axes datapoints with a margin of FACTOR
% AB Apr 02
% axisencompass(x,y,factor)
%
% Does not work for loglog axes because AXIS does not
%
% See also EXTREMEAXIS & EXTREMEAXISDATA

if nargin<3,
    factor=0.1;
end

maxx=max(x);
minx=min(x);
maxy=max(y);
miny=min(y);

difx=maxx-minx;
dify=maxy-miny;

maxx=maxx+factor*difx;
minx=minx-factor*difx;
maxy=maxy+factor*dify;
miny=miny-factor*dify;

axis([minx maxx miny maxy])
