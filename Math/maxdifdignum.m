function nmax = maxdifdignum(ndig)
% Yields maximum number with all digits different from each other

nmax = [];
for i = 0:ndig-1,
   nmax = [nmax,num2str(9-i)];
end
nmax = str2num(nmax);

