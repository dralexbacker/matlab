function [ks,mnmnneighbordeg]=neighbordegfndeg(mat)
% NEIGHBORCONNFNK - Yields degree of neighbors as fn of a node's degree for
% an undirected graph
% AB Mar 03
%
% Takes connectivity matrix as input, mat(i,j)=1 iff i connects to j

%nol=sum(mat'>0); % # of fwd neighbors per node, outgoing links
%nil=sum(mat>0); % # of backward neighbors per node, incoming links

deg=sum(mat); % Degree of each node
[ks,i]=unique(deg); % vector of different k's

knum=0;
for k=ks,
    knum=knum+1;
    cases=find(deg==k);
    Ncaso=0; mnneighbordeg=[];
    for caso=cases,
        Ncaso=Ncaso+1;
        neighbors=find(mat(caso,:));
        mnneighbordeg(Ncaso)=mean(deg(neighbors)); % Calculate mean degree of all neighbors of each node of degree k
    end
    mnmnneighbordeg(knum)=mean(mnneighbordeg); % Because they all share k, and so each neighbor is equally diluted, averaging the averages is the same as averaging the original set
end
clf;
loglog(ks,mnmnneighbordeg,'x')