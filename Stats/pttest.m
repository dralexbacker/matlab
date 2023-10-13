function  [significance,h] = pttest(x,y,alpha,tail)
%PTTEST Hypothesis test: Compares the averages of two samples.
%AB 5/11/98
%   function  [significance,h] = pttest(x,y,alpha,tail) performs a t-test to  
%   determine whether two paired samples from a normal distribution
%   (with unknown but equal variances) could have the same mean. 
%
%   The null hypothesis is: "means are equal".
%
%   The null hypothesis is: "means are equal".
%   For TAIL =  0  the alternative hypothesis is: "means are not equal."
%   For TAIL =  1, alternative: "mean of X is greater than mean of Y."
%   For TAIL = -1, alternative: "mean of X is less than mean of Y."
%   TAIL = 0 by default.
%
%   SIGNIFICANCE is the probability of observing the given result by 
%   chance given that the null hypothesis is true. Small values of 
%   SIGNIFICANCE cast doubt on the validity of the null hypothesis.
%
%   ALPHA is the desired significance level (0.05 by default)
%
%   Requires statistical toolbox in order to convert t-value into SIGNIFICANCE
%  
%   Tested to equal TTEST in ftp://eivind.imm.dtu.dk/pub/cyril/avevar.m
% Adapted from ttest2 (Mathworks Stats toolbox) and Numerical Recipes in C, p.618
%
% PTTEST & PTTEST2 yield identical results; PTTEST allows one-tailed comparisons and alternative p-values.

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
if nargin < 4, 
    tail = 0; 
end 

% Aca empieza Alex
n = length(x);
if n~=length(y),
	error('Paired t-test requires equal # of samples in each population.');
end
df= n-1;

ave1 = mean(x);
ave2 = mean(y);
covar = sum((x-ave1).*(y-ave2))/df;
sd = sqrt((var(x)+var(y)-2*covar)/n);
if sd,
    t= (ave1-ave2)/sd;
    % Find the significance probability for the  tail = 1 test.
    significance  = 1 - tcdf(t,df);
    
    % Adjust the significance probability for other null hypotheses.
    if tail == -1
        significance = 1 - significance;
    elseif tail == 0
        significance = 2 * min(significance,1 - significance);
    end
    
elseif ave1==ave2,
    significance=1; % distributions identical
else,
    significance=0; % distributions have zero variance but are different
end

% Determine if the actual significance exceeds the desired significance
h = 0;
if significance <= alpha, 
    h = 1; 
end 

if isnan(significance), 
    h = NaN; 
end
