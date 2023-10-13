function [ax,h]=subtitle(text,fontsize)

%SUBTITLE
%function [ax,h]=subtitle(text,fontsize)
%Centers a title over a group of subplots.
%Returns a handle to the title and the handle to an axis.
% [ax,h]=subtitle(text)
%           returns handles to both the axis and the title.
% ax=subtitle(text)
%           returns a handle to the axis only.

% Mili Ashar
% Technical Support Engineer
% mashar@mathworks.com

if nargin<2,
   fontsize = 12;
end

ax=axes('Units','Normal','Position',[.075 .075 .85 .87],'Visible','off');
set(get(ax,'Title'),'Visible','on')
title(text,'fontsize',fontsize,'fontweight','bold');
if (nargout < 2)
  return
end
h=get(ax,'Title');

