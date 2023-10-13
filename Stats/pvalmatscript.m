% PVALmatscript
% Return p-value as a function of the # of experiments N (for N1=N2) & p-diff (0 to 1)
% AB Aug 01
% p-diff is the difference in success probabilities observed under two conditions
%
% PVALMAT is an nxm matrix with p(i,j) indicating the p-value for N=i, p-diff=j.

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