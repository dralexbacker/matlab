function mat=randomizeundirectednetwork(mat,Niter)
% RANDOMIZEundirectedNETWORK - Randomizes edges, maintaining degree distribution
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
    [i1,j1]=ind2sub(s,edges(edge1));
    [i2,j2]=ind2sub(s,edges(edge2));    
    if ~mat(i1,j2) & ~mat(i2,j1), % If no preexisting edge in new position, since can't have 2 edges b/w same pair of nodes
        
        % Delete old edges:
        mat(edges(edge1))=0;
        mat(edges(edge2))=0;
        [i,j]=ind2sub(s,edges([edge1,edge2]));

        % Create new edges:
        mat(i1,j2)=1;
        mat(i2,j1)=1;
        mat(j2,i1)=1;
        mat(j1,i2)=1;
        
        % Update EDGES:
        ind=sub2ind(s,i1,j2);
        edges(edge1)=ind;
        ind=sub2ind(s,i2,j1);
        edges(edge2)=ind;
        ind=sub2ind(s,j2,i1);
        edges(edge1)=ind;
        ind=sub2ind(s,j1,i2);
        edges(edge2)=ind;
    end
    
end


