function num = rndnum(ndig)
% function num = rndnum(ndig)
% Yields a random number of NDIG digits with all digits different from each other
% AB Dec 98

if ndig>10,
   error('Cannot have more than 10 different digits')
end

for i = 1:ndig,
   numa(i) = floor(rand(1)*10);
end

num = arr2num(numa);

% RNDNUM.M seems to work, 12/30/98
