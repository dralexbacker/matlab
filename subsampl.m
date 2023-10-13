function subsampled = subsampl(imagen,xstep,ystep)
% SUBSAMPL
% AB May 97
%		Returns a matrix subsampled by 1 in xstep in the x
%		direction and 1 in ystep in the y direction

s = size(imagen);
subsampled = imagen(1:xstep:s(1),1:ystep:s(2));
