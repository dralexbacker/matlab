function [ax,h]=subxlabel(text,fontsize)

%SUBXLABEL
%function [ax,h]=subxlabel(text,fontsize)
%Centers an X-label at the bottom of a group of subplots.
%Returns a handle to the xlabel and the handle to an axis.
% [ax,h]=subtitle(text)
%           returns handles to both the axis and the title.
% ax=subtitle(text)
%           returns a handle to the axis only.

% Modified from SUBTITLE, original by
% Mili Ashar
% Technical Support Engineer
% mashar@mathworks.com

if nargin<2,
   fontsize = 12;
end

ax=axes('Units','Normal','Position',[.1 .075 .85 .87],'Visible','off');
set(get(ax,'Xlabel'),'Visible','on')
xlabel(text,'fontsize',fontsize,'fontweight','bold');
if (nargout < 2)
  return
end
h=get(ax,'Xlabel');

