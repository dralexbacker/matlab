function ste=ste(X,dim)
% STE - Standard error
% AB Nov 00, revised Jan 02
%
% STE = ste(X,dim)
% DIM = dimension along which to calculate std error. Default 1

if min(size(X))==1,
    nsets=length(X);
else,
    nsets=size(X,1); % # of lines
end

if nargin==1,
    ste=std(X)/sqrt(nsets);
else,
    ste=std(X,0,dim)/sqrt(size(X,dim));
end