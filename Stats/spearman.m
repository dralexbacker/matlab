function [r,sig]=spearman(x,y,tail)
% SPEARMAN - Returns Spearman's rank-order correlation coefficient & its associated p-value
% function [r,sig]=spearman(x,y,tail)
% AB Sep 00
% Reference: Numerical recipes in C, p. 640
%
% AB Sep 01: If data is clustered and SPEARMAN fails to pick up a correlation, bin data in bins that include many points that are 
% within noise variability from each other and then run SPEARMAN on the bin numbers instead. This will alleviate the problem of
% rank-order correlation, namely that a huge gap between two successive points looks identical to a tiny noise-induced gap between
% two others if you only look at rank order.
%
% X & Y must be the same length
%
%   For TAIL=0,  alternative: "mean is not M".
%   For TAIL=1,  alternative: "mean is greater than M"
%   For TAIL=-1, alternative: "mean is less than M"
%   TAIL = 0 by default.
%
% See also SPEARMAN2

nx=length(x);
ny=length(y);
if nx~=ny,
   error('Spearmans ranksum test requires that x & y be the same length')
else,
   n=nx;
end
if ~exist('tail','var'),
   tail=0;
end
if ~any(diff(x)) | ~any(diff(y)),
    error('Spearman corr coeff requires some variation in input distributions')
end
    
rankx=order(x);
ranky=order(y);

r=corrcoef(rankx,ranky);
r=r(1,2);
if r==1, % perfect correlation: r=1, sig=0
    t=Inf;
else
    t=r*sqrt((n-2)/(1-r^2));
end
df=n-2; % degrees of freedom
sig=tcdf(t,df);
% the significance just found is for the  tail = -1 test
if tail == 1,
    sig = 1 - sig;
elseif tail == 0
    sig = 2 * min(sig,1 - sig);
end
