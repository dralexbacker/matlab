function     pvalue=binodifcdf(dif,p,N1,N2)
% BINODIFCDF - Binomial difference cumulative distribution
% pvalue=binodifcdf(dif,p,N1,N2)
% AB Aug 01
% Yields the cumulative probability distribution that the difference b/w 2 # of heads  is greater than or equal to DIF 
% if the underlying probability is P12 and N1 & N2 are the # of observations in each experiment
% Default N2 = N1

%dif,p,N1,N2

if nargin<4,
    N2=N1;
end
if N2<N1, % Ensure N2>=N1
    [N1,N2]=swap(N1,N2);
end

pvalue=0;
for Nh1=0:min(N1,N2-dif), % Nh1<=Nh2
    for d=dif:N2-Nh1,
        Nh2=Nh1+d;
        pv=binopdfab(Nh1,N1,p)*binopdfab(Nh2,N2,p);
        pvalue=pvalue+pv;
%        [Nh1,Nh2,pv]
    end
end

if dif==0, % To avoid repeating the situation Nh1=Nh2 above and below, do not count it again. Equiv: dif=max(dif,1);
    dif=dif+1;
end
for Nh2=0:N1-dif, % Nh2<Nh1
    for d=dif:N1-Nh2,
        Nh1=Nh2+d;
        pv=binopdfab(Nh1,N1,p)*binopdfab(Nh2,N2,p);
        pvalue=pvalue+pv;
%        [Nh1,Nh2,pv]
    end
end

% pvalue
% if pvalue>1,
%     error('BINODIFCDF error: p-val>1')
% end