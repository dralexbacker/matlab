function linearityplot(param,reading,fig)
% function linearityplot(param,reading,fig)
% AB Sep 00
%
% Plot histogram (distribution, frequency of each reading) for each value of
% PARAM separately 
% READING and PARAM are vectors of equal length; ea. PARAM value gives the 
% value of the parameter for the corresponding READING value
% FIG is an optional figure # to be used; default 1

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
% PARAMLIST is an optional list of all different values in PARAM, calculated within if absent

if ~exist('fig','var') | isempty(fig),
  fig = 1;
end
figure(fig)
clf reset
ind=find(param<.25 & param~=.01); % Sensor saturated on this gain below .25, and .01 was not used for experiments.
param=param(ind);
reading=reading(ind);
plot(param,reading,'x','Markersize',14)
hold on
p = polyfit(param,reading,1);
y=polyval(p,param);
plot(param,y,'-')

%mini=min(param);
%miniind=find(param==mini);
%miniind=miniind(1);
%maxi=max(param);
%maxiind=find(param==maxi);
%maxiind=maxiind(1);
%plot(param([miniind maxiind]),reading([miniind maxiind]),'-')

set(gca,'Fontsize',19)
axis([ -.02 .25 -.1 8.1])
title('Sensor readings as a function of concentration','Fontsize',19)
ylabel('Sensor reading','Fontsize',19)
xlabel('Concentration specified','Fontsize',19)


