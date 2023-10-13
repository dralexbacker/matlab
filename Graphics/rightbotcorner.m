function [ax,h]=rightbotcorner(fontsize)

% RIGHTBOTCORNER
%function [ax,h]=rightbotcorner(fontsize)
%Centers a title way under a group of subplots.
%Returns a handle to the title and the handle to an axis.
% [ax,h]=subtitle(text)
%           returns handles to both the axis and the title.
% ax=subtitle(text)
%           returns a handle to the axis only.

% Mili Ashar
% Technical Support Engineer
% mashar@mathworks.com
% 
% See also BOTTITLE, SUBTITLE, SUBBOTTITLE

if nargin<1,
   fontsize = 12;
end

ax=axes('Units','Normal','Position',[.075 -.03 .85 0.015],'Visible','off');
dstr=date;
h=text(.8,.8,dstr) %,'fontsize',fontsize)
set(h,'Visible','on');