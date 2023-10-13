% isbinomialpvalfndifponly
% Shows that p-value returned by binomialanal is not only a function of abs(p1-p2), N1 and N2, but rather also of p1 & p2, because the relative probabilities
% of different underlying success probabilities are different for different p1 & p2 pairs even for constant difference:
% More extreme values of p1 & p2 indicate more consistent processes with smaller variances, and thus the probability of observing the
% same difference by chance gets smaller as p1 & p2 get away from 0.5
% AB Aug 01

clear
N1=20;
N2=20;
p1=.8*N1;
p2=.6*N2;
dif=abs(p1-p2);
precision=0.1;
p1vec=[0:16]; %[.1:.1:.8].*N1
lp=length(p1vec);

c=0;
h=waitbar(0);
for p1=p1vec,
    c=c+1;
    waitbar(c/lp,h);
    p2=p1+dif;
    realpval(c) = binomialanal(p1,p2,N1,N2,precision)
end
close(h)

plot(p1vec/N1,realpval)