function contfn = list2contraster(positions,values,length)

contfn = zeros(1,length)-2*pi;
contfn(positions)=values;
