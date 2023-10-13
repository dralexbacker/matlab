function [centersf,nf,centersb,nb]=graphconndistrib(conmat,nbins)
% GRAPHCONNDISTRIB - Graph connectivity distribution
% AB Apr 03
%
% [centersf,nf,centersb,nb]=graphconndistrib(conmat)
%
% CONMAT- Connectivity matrix: (cohmat(i,j)=# of times fn i calls fn j
%
% Outputs:
% CENTERS: centers of bin of histogram
% NF: Counts corresponding to CENTERS for Fwd links
% NB: Counts corresponding to CENTERS for Backwd links

if nargin<2 | isempty(nbins),
    nbins=20;
end
fs=16;

nofn=sum(conmat'>0); % outlink, # of fwd neighbors
nobn=sum(conmat>0); % inlink, # of backward neighbors
% Because it's >0, it's links indep of weight
% Because it's hist of sum ax cols or lines, it's # of nodes for each # of
% links (connectivity)

figure(1)
clf
range=log(max(nofn));
range=range(1,1);
expo=0:range/nbins:range;
centersf=10.^expo;
range=log(max(nobn));
range=range(1,1);
expo=0:range/nbins:range;
centersb=10.^expo;
[nf,centersf]=hist(nofn,centersf);
[nb,centersb]=hist(nobn,centersb);
loglog(centersf,nf,'rx')
%loglog(hist(nofn,nbins),'rx')
%title('Forward (red) & backward (blue) neighbors')
title('Out- (red) & in- (blue) degree distributions','Fontsize',fs)
hold on
%loglog(hist(nobn,nbins),'bx')
loglog(centersb,nb,'bx')
xlabel('Degree','Fontsize',fs)
ylabel('# of nodes','Fontsize',fs)

figure(2)
clf
cumsumf=cumsum(nf(end:-1:1));
cumsumf=cumsumf(end:-1:1);
cumsumb=cumsum(nb(end:-1:1));
cumsumb=cumsumb(end:-1:1);
%[nf;cumsumf]
%[nb;cumsumb]
loglog(centersf,cumsumf,'rx')
title('Cumulative out- (red) & in- (blue) degree distributions','Fontsize',fs)
hold on
loglog(centersb,cumsumb,'bx')
xlabel('Degree','Fontsize',fs)
ylabel('# of nodes','Fontsize',fs)

figure(3) % scatter plot in vs out degrees
clf
loglog(nofn,nobn,'x')
xlabel('Out-degree','Fontsize',fs)
ylabel('In-degree','Fontsize',fs)

THIS=0;
if THIS,
figure(5)
[nf,centers]=hist(nofn);
nb=hist(nobn,centers);
bar(centers,[nf;nb]')
xlabel('Degree','Fontsize',fs)
ylabel('# of nodes','Fontsize',fs)
end

if 0,
figure(4)
plot(hist(nofn,nbins),'rx')
title('Out- (red) & in- (blue) degree distributions','Fontsize',fs)
hold on
plot(hist(nobn,nbins),'bx')
xlabel('Degree','Fontsize',fs)
ylabel('# of nodes','Fontsize',fs)
end
