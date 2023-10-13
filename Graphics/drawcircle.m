function drawcircle
% AB May 03

% Draw 2 half circles:
h1=patch(x,y,zeros(size(x)));
h2=patch(x,-y,.5*ones(size(x)));
set(h2,'FaceColor',[.5 .5 .5])
axis off
set(h2,'EdgeAlpha',0)
