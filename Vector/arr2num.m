function num = arr2num(numa)
% function num = arr2num(numa)
% Yields a number whose digits are made out of the digits in the 1-D array numa

if size(numa,1)~=1 and size(numa,2)~=1,
   error('Input must be 1-D array')
end

le = length(numa);

num=0;
for i = 1:le,
   num = num+numa(i)*10^(le-i);
end

