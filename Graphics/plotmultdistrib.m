function done = plotmultdistrib(reading,param,fig,paramlist,numbins,width)
% function done = plotmultdistrib(reading,param,fig,paramlist,numbins,width)
% AB Mar 00
%
% Linearity Plot for Odogen with CO2 sensor - Use readings.mat from tape28/
% READING and PARAM are vectors of equal length; ea. PARAM value gives the 
% value of the parameter for the corresponding READING value
% FIG is an optional figure # to be used; default 1
% PARAMLIST is an optional list of all different values in PARAM
% NUMBINS is the # of bins to use in the histograms, default 10
% WIDTH is the bar width, 1 is no overlap or space b/w bars

stdev = 1;
if ~exist('numbins') | isempty(numbins),
  numbins = 10;
end
if ~exist('width') | isempty(width),
   width = 0.97; % Bar width
end
if ~exist('paramlist') | isempty(paramlist),
  paramlist = sort(uniquify(param)); %[.01 .02 .05 .1 .2 .4 1];
end

if ~exist('fig','var') | isempty(fig),
  fig = 1;
end
figure(fig)
clf reset
hold on

minread = min(reading);
maxread = max(reading);
difread = maxread-minread;
bincenters = [minread:difread/numbins:maxread];

nconc = length(paramlist)-1;  % ****** no minus 1
for i = 1:nconc,
  readingm = reading(find(param==paramlist(i)));
  stats(i,:) = [paramlist(i),mean(readingm),std(readingm)];
%  n(i,:)=smooth(hist(readingm,bincenters),stdev);
  n(i,:)=hist(readingm,bincenters);
end
bar(bincenters,n',width,'grouped')
title('Distribution of sensor readings for each odor concentration')
xlabel('Sensor reading')
ylabel('Frequency')
hold off

stats
