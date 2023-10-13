function rounded = floorsigfig(X,numfig)
% function rounded = floorsigfig(X,numfig)
% rounds the elements of X *down* to numfig significant figures
% AB 4/28/97

numdig = (X>0).*ceil(log10(X));	% # of digits in integer part
rounded = floor(X.*10.^(numfig-numdig)) ./ 10.^(numfig-numdig);
