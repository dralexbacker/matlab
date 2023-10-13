function right(value)
% Sets right limit of horizontal axis of current figure to VALUE
% AB Oct 01

ejes=axis;
ejes(2)=value;
axis(ejes);
