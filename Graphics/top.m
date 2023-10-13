function top(value)
% Sets upper limit of vertical axis of current figure to VALUE
% AB Oct 01

ejes=axis;
ejes(4)=value;
axis(ejes);
