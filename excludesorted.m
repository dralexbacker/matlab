function [remains,ind] = excludesorted(vector,inclmax,startind)
% EXCLUDEsorted - For vectors
% function [remains,ind] = excludesorted(vector,inclmax,startind)
% AB Jun 00
%
% See also EXCLUDE & EXCLUDEMAT, slower version that works for matrices too

remains=vector;
if ~exist('inclmax','var') | isempty(inclmax),
    inclmax = Inf;
end
if ~exist('startind','var') | isempty(startind),
    startind = 1;
end
i=startind;

lv=length(vector);
if lv,
    while vector(i)<=inclmax & i<lv,
        i = i+1;
    end
    
    if i,
        remains = vector(startind:i-1);
        ind=[startind:i-1];
    else,
        remains=[];
        ind=[];
    end
else,
    remains=[];
    ind=[];
end