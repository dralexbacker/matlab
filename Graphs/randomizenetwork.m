function mat=randomizenetwork(mat,Niter)
% RANDOMIZENETWORK - Randomizes edges, maintaining degree distribution
% As per Maslov & Sneppen, Sci 2002
% AB: Can be done on undirected graph before undirecting it
% AB Nov 03

deg=sum(mat); % Degree of each node

s=size(mat);
edges=find(mat);

[i,j]=ind2sub(s,edges);
m=[i,j];
c=corrcoef(m);

Nedges=length(edges);
while Niter,
    Niter=Niter-1;
    edge1=ceil(rand(1)*Nedges);
    edge2=edge1;
    while edge2==edge1,
        edge2=ceil(rand(1)*Nedges);
    end
    [i1,j1]=ind2sub(s,edge1);
    [i2,j2]=ind2sub(s,edge2);    
    if ~mat(i1,j2) & ~mat(i2,j1), % If no preexisting edge in new position, since can't have 2 edges b/w same pair of nodes
        mat(edges(edge1))=0;
        mat(edges(edge2))=0;
        %    mat(i1,j1)=0;
        %    mat(j1,i1)=0;
        %
        %
        mat(i1,j2)=1;
        mat(i2,j1)=1;
        %   mat(j2,i1)=1;
        %   mat(j1,i2)=1;
    end
    
end


