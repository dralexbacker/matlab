function lowestnum = findresol()

n=1;
while n>0,
  prevn = n;
  n = n/10
end
lowestnum = prevn;
