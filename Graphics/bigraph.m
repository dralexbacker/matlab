function done = bigraph(side,fig,title,subtit1,subtit2)

% Plots a figure with 2 graphs horizontally side by side, landscape, with title and subtitle
% AB Jun 98
% Must be called with side=1 for left first, then with side=2 for right
%
% side = 1 for left, 2 for right
% fig = figure # (handle)

% Change these for each use:
%mytitle = '\beta-LN';
mytitle = 'PN';
subtit1 = 'Control';
subtit2 = 'PCT';

if ~exist('fig'),
   fig = 1;
end

if side==1,
close(fig)
figure(fig)
orient landscape
todo = axes('position',[0 0 1 1],'Visible','off');
Htit = text(.5,.95,mytitle,'units','normalized','FontWeight','bold','HorizontalAlignment',...
   'center','VerticalAlignment','top','FontSize',33,'FontName','Times');
izq = axes('position',[.1 .22 .37 .45]);
Hsub1 = text(.5,1.3,subtit1,'units','normalized','HorizontalAlignment',...
   'center','VerticalAlignment','top','FontSize',23,'FontName','Times');
elseif side==2,
   figure(fig)
   orient landscape
   hold on
   der = axes('position',[.6 0.22 .37 .45])
	Hsub2 = text(.5,1.3,subtit2,'units','normalized','HorizontalAlignment',...
   'center','VerticalAlignment','top','FontSize',23,'FontName','Times')
	hold off
else,
   error('Side must be 1 or 2')
end



done = 1;
