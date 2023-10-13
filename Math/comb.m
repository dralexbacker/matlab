function num = comb(tot,ntochus)
% COMB
% function num = comb(tot,ntochus)
% COMB returns TOT choose NTOCHUS
% AB 2/98
% Obsolete, same as Mathwork's NCHOOSEK

%num = fact(tot)/(fact(ntochus)*fact(tot-ntochus));

% Alternate algorithm that allows greater numbers without Inf overflow
%	by simplifying the fraction before calculating it

a = max(ntochus,tot-ntochus);
b = min(ntochus,tot-ntochus);
num = prod(a+1:tot)./fact(b);