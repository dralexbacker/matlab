function p=spearman2(x,y)
% SPEARMAN2 - Returns the  p-value associated with the sum squared difference of ranks version of Spearman's rank-order test
% function [p]=spearman2(x,y)
% AB Sep 00
% Reference: Numerical recipes in C, p. 640
%
% X & Y must be the same length
%
% See also SPEARMAN
% Need to define ERFCC, BETAI & FABS for this to work

nx=length(x);
ny=length(y);
if nx~=ny,
   error('Spearmans ranksum test requires that x & y be the same length')
else,
   n=nx;
end

x=sort(x);
y=sort(y);
rankx=order(n,x);
ranky=order(n,y);
d=sum((rankx-ranky).^2);
en=n;
en3n=en^3;
aved=en3n/6-(rankx+ranky)/12;
fac=(1-rankx/en3n)*(1-ranky/en3n);
vard=((en-1)*en^2*(en+1)^2/36)*fac;
zd=(d-aved)/vard^2;
probd=erfcc(fabs(zd))/1.4142136;
rs=(1-(6/en3n)*(d+(sf+sg)/12))/sqrt(fac);
fac=(rs+1)*(1-rs));
if fac>0,
   t=rs*sqrt((en-2_/fac);
   df=en-2;
   probrs=betai(.5*df,.5,df/(df+t^2));
else,
   probrs=0;
end
