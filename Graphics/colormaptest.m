%colormaptest

figure

subplot(2,1,1)
data=[6:.1:10;5:.1:9];
h=image(data);
setcdata(hsv,data,[5 9],h)

subplot(2,1,2)
h=image(data);
setcdata(hot,data,[5 9],h)

[h,imh]=colorbarab;
setcdata(hot,[1:size(colormap,1)]',[1 size(colormap,1)],imh)

%print -dwinc