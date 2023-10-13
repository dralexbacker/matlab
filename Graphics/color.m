function s = color(num)
% Gives a letter representing a color for PLOT command 
% Takes an integer as input
% Color-integer assignment is given below
% AB May 97, modified Mar 02
%
% Color table used:
% 	       k     black         -.    dashdot
% 	       r     red           +     plus
% 	       c     cyan          x     x-mark
% 	       g     green         -     solid
% 	       b     blue          *     star
% 	       w     white         :     dotted
%	       y     yellow        .     point
% 	       m     magenta       o     circle
% New version excludes white
% After cycling through full lines, uses dashed, then dotted, then dash-dot, then back to full lines and keeps them
%
% See also COLOR3D

c = rem(num,7);
if c == 1,
	s = 'k';
elseif c == 2,
	s = 'r';
elseif c == 3,
	s = 'c';
elseif c == 4,
	s = 'g';
elseif c == 5,
	s = 'b';
elseif c == 6,
	s = 'y';
else	%if c == 0,
	s = 'm';
end

if num>7,
    if num<14,
        s=[s,':'];
    elseif num<21,
        s=[s,'--'];
    elseif num<28,
        s=[s,'-.'];
    end
else,
    s=[s,'-'];
end


  	       