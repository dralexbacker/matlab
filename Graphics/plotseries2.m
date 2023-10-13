function plotseries2(param,reading,fig)
% function plotseries2(param,reading,fig)
% AB Sep 00
%
% Plot sensor reading as fn of trial # in series for each series. Call with concreading & sensorreading of tape28\readings.mat
%
% READING and PARAM are vectors of equal length; ea. PARAM value gives the 
% value of the parameter for the corresponding READING value
% FIG is an optional figure # to be used; default 1


if ~exist('fig','var') | isempty(fig),
  fig = 1;
end
figure(fig)
clf reset
hold on
ind=find(param<.25 & param~=.01); % Sensor saturated on this gain below .25, and .01 was not used for experiments.
param=param(ind);
reading=reading(ind);
if ~exist('paramlist') | isempty(paramlist),
  paramlist = sort(uniquify(param)); %[.01 .02 .05 .1 .2 .4 1];
end
% PARAMLIST is an optional list of all different values in PARAM, calculated within if absent

difconc=diff(param);
chconc=[1,find(difconc)+1,length(param)+1];
nseries=length(chconc)-1;
for i=1:nseries,
   series{i}=reading(chconc(i):chconc(i+1)-1);
   conc{i}=param(chconc(i));
   nconc=find(paramlist==conc{i});
   plot(series{i},'-','Color',color(nconc))
end

set(gca,'Fontsize',19)
axis([ 1 25 -.1 8.1])
title('Sensor readings as a function of trial # in series','Fontsize',19)
ylabel('Sensor reading','Fontsize',19)
xlabel('Trial # in series','Fontsize',19)


