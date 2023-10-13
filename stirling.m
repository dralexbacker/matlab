function fact = stirling(n)
% Yields factorial of n using Stirling approximation for large numbers

fact=exp(-n)*n^n*sqrt(2*pi*n);