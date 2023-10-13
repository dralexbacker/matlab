% Finds which precision to use for binomialanal.m (where p-value found plateaus)
% AB Aug 01

p1=.8*N1;
p2=.6*N2;
N1=20;
N2=20;
precvec=[.01 .02 .05 .1 .2];
lp=length(precvec);

% Which precision to use
c=0;
h=waitbar(0);
for precision=precvec,
    c=c+1;
    waitbar(c/lp,h);
    realpval(c) = binomialanal(p1,p2,N1,N2,precision);
end
close(h)

plot(precvec,realpval)