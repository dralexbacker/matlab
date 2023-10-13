function true = aboveline(x,y,linex,liney)
% ABOVELINE - Each element of the TRUE vector yields 1 if the corresponding point defined by [x y] is above the line 
% 				defined by X-coords [LINEX(1) LINEX(2)] & Y-coords [LINEY(1) LINEY(2)]
% AB Jul 00
% function true = aboveline(x,y,linex,liney)

slope = (liney(2)-liney(1))/(linex(2)-linex(1));
ylineatpoint = slope*(x-linex(1))+liney(1);
true= y>ylineatpoint;

%Eva:
%polyval(polyfit(linex,liney));
%interp1;

