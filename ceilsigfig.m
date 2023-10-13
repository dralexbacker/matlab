function rounded = ceilsigfig(X,numfig)
% function rounded = ceilsigfig(X,numfig)
% rounds the elements of X *up* to numfig significant figures
% AB 4/28/97

numdig = (X>0).*ceil(log10(X));	% # of digits in integer part
rounded = ceil(X.*10.^(numfig-numdig)) ./ 10.^(numfig-numdig);
