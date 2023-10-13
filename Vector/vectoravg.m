function mn=vectoravg(x)
% VECTORAVG - Vector average
% mn=vectoravg(x)
% Yields the vector average of X when each line of X is an observation and each column is a dimension
% AB Aug 00
%
% size(mn) = [1 size(x,2)]

% vector mean = vector sum/n
% vector sum is the sum of each component separately

if size(x,1)==1,
   mn=x;
else,
   mn=mean(x);
end
