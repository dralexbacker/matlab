function [remains,ind] = excludesorted(vector,inclmax)
% EXCLUDEsortedfast - Returns elements of VECTOR smaller than INCLMAX. 
% function [remains,ind] = excludesortedfast(vector,inclmax)
% AB Jun 00
%
% See also EXCLUDE, EXCLUDESORTED & EXCLUDEMAT, slower version that works for matrices too

ind=find(vector<=inclmax);
remains=vector(ind);

