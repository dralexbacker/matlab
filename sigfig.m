function rounded = sigfig(X,numfig)
% function rounded = sigfig(X,numfig)
% rounds the elements of X to numfig significant figures
% AB 4/28/97

if X,
    numdig = (X>0).*ceil(log10(X));	% # of digits in integer part
    rounded = round(X.*10.^(numfig-numdig)) ./ 10.^(numfig-numdig);
else, % log(0) 'd give error
    rounded = 0;
end
