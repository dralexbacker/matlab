function y = binocdfab(x,n,p)
%BINOCDFab Binomial cumulative distribution function.
% AB Aug 01
%   Y=BINOCDF(X,N,P) returns the binomial cumulative distribution
%   function with parameters N and P at the values in X.
%
%   The size of Y is the common size of the input arguments. A scalar input  
%   functions as a constant matrix of the same size as the other inputs.    
%
%   The algorithm uses the cumulative sums of the binomial masses.

if nargin < 3, 
    error('Requires three input arguments.'); 
end 

scalarnp = (prod(size(n)) == 1 & prod(size(p)) == 1);

[errorcode x n p] = distchck(3,x,n,p);

if errorcode > 0
    error('Requires non-scalar arguments to match in size.');
end

% Initialize Y to 0.
y=zeros(size(x));

% Y = 1 if X >= N
k = find(x >= n);
y(k) = 1;


% assign 0 to p==0 indices.
k2 = (p == 0);
y(k2) = 0;

% Return NaN if any arguments are outside of their respective limits.
% this may overwrite k2 indices.
k1 = (n < 0 | p < 0 | p > 1 | round(n) ~= n | x < 0); 
y(k1) = NaN;

% AB:
for i=1:length(x),
    y(i) = sum(binopdfab([0:x(i)],n,p));
end

% Make sure that round-off errors never make P greater than 1.
k = find(y > 1);
y(k) = 1;

