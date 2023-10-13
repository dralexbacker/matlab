function colorvector = color3d(int)
% COLOR3D
%		Yields a 3-vector depending on int, yielding easily distinguishable colors for diff ints
%		1<=int<=7 then recycles
% AB Mar 98
%
% See also COLOR

c = rem(int,10);

switch c
case 1,
   v = [0 0 0];	% 000 is black; 111 is white
case 2,
   v = [1 0 0];
case 3,
   v = [0 1 0];
case 4,
   v = [0 0 1];
case 5,
   v = [1 1 0];
case 6,
   v = [0 1 1];
case 7,
    v=[1 .6 .1]; % orange
case 8,
    v=[.5 .5 0]; % olive
case 9,
    v=[0 .5 1];
case 0,
   v = [1 0 1];
end

colorvector = v;
