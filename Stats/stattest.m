function [signif,H]=stattest(X,Y,TEST,pval)
% Calls statistical test designated by letter in TEST:
% T: T-test
% R: Ranksum test
% K: Kolmogorov-Smirnov test
% P: Paired t-test
%
% [signif,H]=stattest(x,y,TEST,pval)
% AB Dec 01

if nargin<3,
    TEST='P';
end
if nargin<4,
    pval=0.05;
end

if isequal(TEST,'T'), %              'T-test'
    [H,signif]= welcht(X,Y); 
elseif isequal(TEST,'R'), %                'Wilcoxon ranksum test (Mann-Whitney)'
    signif = ranksum(X,Y); 
elseif isequal(TEST,'K'), %                'Kolmogorov-Smirnov test'
    signif = kstest(X,Y);
elseif isequal(TEST,'P'), % Paired t-test
    signif=pttest2(X,Y);
end % if isequal
if signif == 0,
    signif = 10^(-7); % Lowest p-value I've seen t-test or sumrank generate
end
if signif<pval,
    H=1;
else,
    H=0;
end
