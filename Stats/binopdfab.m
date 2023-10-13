function y = binopdfab(x,n,p)
% BINOPDFab Binomial probability density function.
% AB Aug 01
%   Y = BINOPDF(X,N,P) returns the binomial probability density 
%   function with parameters N and P at the values in X.
%   Note that the density function is zero unless X is an integer.
%
%   The size of Y is the common size of the input arguments. A scalar input  
%   functions as a constant matrix of the same size as the other inputs.    
%
%   The Mathwork's BINOPDF can give warning Log of zero if X=N, this one does not.

if nargin < 3, 
    error('Requires three input arguments');
end

[errorcode x n p] = distchck(3,x,n,p);

if errorcode > 0
    error('Requires non-scalar arguments to match in size.');
end

% Initialize Y to zero.
y = zeros(size(x));
 
% Binomial distribution is defined on positive integers less than N.
q=1-p;
ix=n-x;
k = find(x >= 0  &  x == round(x)  &  x <= n);
if any(k),
    for i=1:length(k),
        y(k(i)) = p(k(i)).^x(k(i)).*q(k(i)).^ix(k(i)).*nchoosek(n(k(i)),x(k(i)));
    end
end

k1 = find(n < 0 | p < 0 | p > 1 | round(n) ~= n); 
if any(k1)
   tmp = NaN;
   y(k1) = tmp(ones(size(k1))); 
end