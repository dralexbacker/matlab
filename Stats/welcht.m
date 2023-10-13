function [h, sig, ci] = welcht(x,y,alpha)
%WELCHT Compares the averages of two samples with unequal variances.
%   [H, SIG] = WELCHT(X,Y,ALPHA) performs Welch's t-test to
%   determine whether two samples from a normal distribution
%   (with estimated unequal variances) could have the same mean.
%
%   The null hypothesis is that the means are equal.
%
%   ALPHA is desired significance level (ALPHA = 0.05 by default).
%   SIG is the probability of observing the given result by
%   chance given that the null hypothesis is true. Small values of
%   SIG cast doubt on the validity of the null hypothesis.
%   H=0 => "Do not reject null hypothesis at significance level of alpha."
%   H=1 => "Reject null hypothesis at significance level of alpha."
%
%   [H, SIG, CI] = WELCHT(X,Y,ALPHA) also returns a 100*(1-ALPHA)%
%   confidence interval on the mean of X minus the mean of Y.

%   Copyright (c) 1993-96 by The MathWorks, Inc.

if nargin < 2,
    error('Requires at least two input arguments');
end

[m1 n1] = size(x);
[m2 n2] = size(y);
if (m1 ~= 1 & n1 ~= 1) | (m2 ~= 1 & n2 ~= 1)
    error('Requires vector first and second inputs.');
end

if nargin < 3,
    alpha = 0.05;
end

if (alpha <= 0 | alpha >= 1)
    fprintf('Warning: significance level must be between 0 and 1\n');
    h = NaN;
    sig = NaN;
    return;
end


n   = [length(x) length(y)]';
if any(n == 1)
   error('Each sample must have more than one element.');
end
means = [mean(x) mean(y)]';
s2    = [var(x) var(y)]';
% AB: Correction for division by zero:
if any(s2==0),
   s2(find(~s2))=exp(-600);
end

w     = n./s2;
sw    = sum(w);

gm    = sum(w.*means./sw);

df    = max(1,floor(1./sum((1-w/sw).*(1-w/sw)./(n-1))));


t   = sqrt(sum(w.*(means-gm).*(means-gm)));

criticalvalue = tinv(1 - alpha / 2,df);
dm = mean(x)-mean(y);
delta = criticalvalue*sqrt(sum(1./w));
ci = [dm-delta dm+delta];

% Find the significance probability for the  tail = 1 test.
sig  = 2*tcdf(-t,df);

% Determine if the actual significance exceeds the desired significance
h = 0;
if criticalvalue < t,
    h = 1;
end

if isnan(sig),
    h = NaN;
end
