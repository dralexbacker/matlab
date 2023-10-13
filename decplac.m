function rounded = decplac(X,numdec)

% DECPLAC
% function rounded = decplac(X,numdec)
% Rounds the elements of X to numdec decimal points
% X can be a vector, matrix or scalar.
% AB 4/28/97

decpart = round(rem(X,1)*10^numdec) / 10^numdec;
rounded = fix(X./1) + decpart;
