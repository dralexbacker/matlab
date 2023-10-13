function [h,p]=ttdistrequal(s1,n1,s2,n2,alpha,tail)
% Yields p-value that two samples come from same distribution, using
% T-test test
% function [h,p]=ksdistrequal(s1,n1,s2,n2)
% Si are # of successes, Ni are # of samples
% Default alpha=0.05 significance level, default tail='both'
% (both, right, left)
% H=0 indicates that the null hypothesis ("means are equal") cannot be
%     rejected at the 5% significance level.  H=1 indicates that the null
%     hypothesis can be rejected at the 5% level.  The data are assumed to
%     come from normal distributions with unknown, but equal, variances.  X
%     and Y can have different lengths.
% AB March 14, 2006

if nargin<5,
    alpha=0.05;
end
if nargin<6,
    tail='both';
end

v1=[ones(1,s1),zeros(1,n1-s1)];
v2=[ones(1,s2),zeros(1,n2-s2)];
[h,p]=ttest2(v1,v2,alpha,tail);
return;
