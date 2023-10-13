function unique = uniqueab(v)
% UNIQUE - Yields unique or non-repeating elements in vector
% AB Aug 00 - Algorithm by EP
% unique = uniqueab(vector)
%
% See also UNIQUIFY, OVERLAP, NSHARED, UNIQUE, ISMEMBER

m=v'*ones(1,length(v));
c=m==m';
unique=v(find(sum(c)==1));