function y=fact(x)

y=x;

for i=1:length(x)
	y(i)=prod(1:x(i));
end

% factorial.m
% Calculates the factorial of each element in a vector 
% (incl. a single scalar)
% EP&AB 97