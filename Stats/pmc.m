function pmc=pmc(p,n)
% PMC - P-value for multiple comparisons
% AB Oct 00
% pmc=pmc(p,n)
%
% Returns the probability value (pmc) that should be exceeded in any *one* or more of N comparisons for the probability
% that *any* of the individual measurements' p-value to be p
% E.g. pmc(0.05,2)= 0.05/1+.95

factor=((1-p)*ones(1,n)).^[0:n-1];
div=sum(factor);
pmc=p/div;
