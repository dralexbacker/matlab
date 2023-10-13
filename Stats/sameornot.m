function [msg,pval]=sameornot(conversions1,clicks1,conversions2,clicks2,EXACT)
% Usage: sameornot(successcount1,chances1,successcount2,chances2)
% where SUCCESSCOUNT is the # of events, and CHANCES is the number of
% chances for an event to happen. Examples: 
% SUCCESSCOUNT=# of conversions, CHANCES=# of clicks
% SUCCESSCOUNT=# of clicks, CHANCES=# of impressions
% SUCCESSCOUNT=# of tails, CHANCES=# of coin flips
% Copyright Adapt Technologies 2006
%
% [msg,pval]=sameornot(conversions1,clicks1,conversions2,clicks2)
% Hypothesis test to determine p-value for two samples coming from the same
% binomial distribution
% AB April 2006

N=100;
precision=.05;
if nargin<5,
    EXACT='unspecified';
end

if conversions1>clicks1 | conversions2>clicks2,
    error('Successcount must not be greater than Chances')
end

if isequal(EXACT,0) | (isequal(EXACT,'unspecified') & (clicks1>N | clicks2>N)),
    v1=[ones(1,conversions1),zeros(1,clicks1-conversions1)];
    v2=[ones(1,conversions2),zeros(1,clicks2-conversions2)];
    [h,pval]=ttest2(v1,v2);
else,
    warning off;
    pval = binomialanal(conversions1,conversions2,clicks1,clicks2,precision);
end
%[h,pval]=ksdistrequal(conversions1,clicks1,conversions2,clicks2);

if pval<0.05, 
    msg='The two distributions ARE significantly different'
else,
    msg='The two distributions are NOT significantly different'
end
p=sigfig(pval*100,2);
['The probability that the two sets of results come from the same distribution is ',num2str(p),'%']


