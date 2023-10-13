function [ks,mnneighbordeg]=neighbordegfndegnodup(mat)
% NEIGHBORDEGFNDEG - Yields degree of neighbors as fn of a node's degree for
% an undirected graph
% This version, unlike NEIGHBORDEGFNDEG, averages over the set of neighbors
% w/o using any node more than once
% AB Mar 03
%
% Takes connectivity matrix as input, mat(i,j)=1 iff i connects to j

%nol=sum(mat'>0); % # of fwd neighbors per node, outgoing links
%nil=sum(mat>0); % # of backward neighbors per node, incoming links

deg=sum(mat); % Degree of each node
[ks,i]=unique(deg); % vector of different k's

mnneighbordeg=[];
knum=0;
for k=ks,
    knum=knum+1;
    cases=find(deg==k);
    s=sum(mat(cases,:));
    mnneighbordeg(knum)=sum(s.*deg)/sum(s); % /# of edges
 % Calculate mean degree of all neighbors of each node of degree k
end
clf;
loglog(ks,mnneighbordeg,'x')