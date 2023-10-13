function nmin = mindifdignum(ndig)
% MINDIFDIGNUM - Yields minimum number with all digits different from each other

nmin = [];
for i = 0:ndig-1,
   nmin(i+1) = i;
end
nmin = arr2num(nmin);
