function [p, t, df] = uttest(d1, d2,tail)
%UTTEST Student's t-test for unequal variances.
%       UTTEST(X1, X2,tail) gives the probability that Student's t
%       calculated on data X1 and X2, sampled from distributions
%       with different variances, is higher than observed, i.e.
%       the "significance" level.  This is used to test whether
%       two sample have significantly different means.
%       [P, T] = UTTEST(X1, X2) gives this probability P and the
%       value of Student's t in T. The smaller P is, the more
%       significant the difference between the means.
%       E.g. if P = 0.05 or 0.01, it is very likely that the
%       two sets are sampled from distributions with different
%       means.
%
%   The null hypothesis is: "means are equal".
%   For TAIL =  0  the alternative hypothesis is: "means are not equal."
%   For TAIL =  1, alternative: "mean of X is greater than mean of Y."
%   For TAIL = -1, alternative: "mean of X is less than mean of Y."
%   TAIL = 0 by default.
%
%       This works if the samples are drawn from distributions with
%       DIFFERENT VARIANCE. Otherwise, use TTEST.
%
%See also: TTEST, PTTEST.

% AB modifications for zero variance to avoid errors:
if var(d1)==0 & var(d2)==0,
   if d1(1)==d2(1),
      p=1;
      %'Both distributions consist of identical samples'
   else,
      p=0;
      %'Both distributions have zero variance and are different from each other'
   end
else,
[l1 c1] = size(d1) ;
n1 = l1 * c1 ;
x1 = reshape(d1, l1 * c1, 1) ;
[l2 c2] = size(d2) ;
n2 = l2 * c2 ;
x2 = reshape(d2, l2 * c2, 1) ;
[a1 v1] = avevar(x1) ;
[a2 v2] = avevar(x2) ;
df = (v1 / n1 + v2 / n2) * (v1 / n1 + v2 / n2) / ...
     ( (v1 / n1) * (v1 / n1) / (n1 - 1) + (v2 / n2) * (v2 / n2) / (n2 -1) ) ;
t = (a1 - a2) / sqrt( v1 / n1 + v2 / n2 ) ;
p = betainc( df / (df + t*t), df/2, 0.5) ;

% AB addition from TTEST to give different tail possibilities:
% the significance just found is for the  tail = 0 test
%if tail == 1
%   p=min(
%    p = 1 - p;
%elseif tail == 0
%    p = 2 * min(p,1 - p);
%end

end
