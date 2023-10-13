function [dogx,dogvar] = dog(x,variance)
% DOG - derivative of gaussian with respect to x and wrt variance
% function [dogx,dogvar] = dog(x,variance)
% AB May 97
%
% See also GAUSSIAN

dogx = -1*(x/variance).*gaussian(x,variance);
dogvar = 1/(2*variance)*(-1/2*variance^(-3/2)+1/2*variance^(-5/2).*x.^2).*exp(-1*x.^2/2*variance);
