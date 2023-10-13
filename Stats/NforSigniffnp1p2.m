function nmat=NforSigniffnp1p2(sigval,prevmat)
% Return the # of experiments needed to get a p-value=sigval (default 0.05) as a function of p1 & p2
% AB Aug 01
%
% NMAT is an nxm matrix with p(i,j) indicating the p-value for p1=i, p2=j.
%
% PREVMAT provides an opportunity to fill in a previously calculated nmat with greater resolution

if nargin<1,
    sigval=0.05;
end

precision=0.1;
pinterv=0.1;
NSvec=[0:pinterv:1]; % # of successes
lNS=length(NSvec);

c=0;
h=waitbar(0);
i=0;
tic
nmat=ones(lNS)*100;
if exist('prevmat','var'),
    nmat=prevmat;
end
for NS1=NSvec,
    i=i+1;
    j=i;
    for NS2=NS1+pinterv:pinterv:1, % pval(p1,p1)=1 independent of N so nforsig(p1,p1)=Inf
        j=j+1;
        c=c+1;
        waitbar(c/(lNS^2-lNS)/2,h);
        if ~exist('prevmat','var') | prevmat(i,j)==8,
            nmat(i,j) = nforsig(NS1,NS2,sigval,precision);
            nmat(j,i) = nmat(i,j);
        end
        [NS1,NS2,nmat(i,j),toc]
    end
end
close(h)

figure
imagesc(nmat)
figure
surf(NSvec,NSvec,nmat)

function nforsig=nforsig(p1,p2,sigval,precision)

niter=300;
maxN=50;
nforsig=100; % Default value indicates nforsig>maxN
for N=1:maxN,
    NS1=round(p1*N);
    NS2=round(p2*N);
    pval=binomialanal(NS1,NS2,N,N,precision);
%    pval=binomialiter(p1,p2,N,N,precision,niter);
    if pval<=sigval,
        nforsig=N;
        break
    end
end

%function nforsig=nforsigfast(
%optimize(functionname,params,result2achieve,param2vary,range)
%rangeN=max(NS1,NS2)
