function undirmat=undirect(directedmat)
% Convert a directed graph into an undirected graph by converting each edge
% into a two-way edge
% AB Nov 03

undirmat=directedmat|directedmat';

%f=find(tril(directedmat))';
%directedmat(f)=directedmat(f)|directedmat(find(triu));
%f=find(triu);
%directedmat(f)=directedmat ...