function scc=scc(M)
% SCC - Yields strongly connected components of graph given by M
% AB Nov 03
%
% SCC{i} is the i'th strongly connected component
%
% M(i,j)=1 if there is an edge between vertex i and vertex j, 0 otherwise

if ~issquare(M),
    error('SCC input matrix must be square')
end

[R,diam]=paths(M);

scc={};
vertexnums=1:length(M);
while ~isempty(M),
    [C,IA,IB] = intersect(M(1,:),M(2:end,:),'rows'); % SCC may have edges going out of the SCC, so rows may not all be identical
    % If M(j,i)==0, then i is not part of an SCC with j. SCC including j
    % can be any subset of candidatevertices=find(M(j,i)==1). Once you
    % check M(candidatevertices(1),:), repeat for  j=candidatevertices(1). 
    % If you're testing a particular subset of vertices to see if they're
    % an SCC, find the intersection of their rows' ones, and then check as
    % below.
    IB=[1 1+IB];
    subM=M(IB,IB); % if it's all(all()), it must be symmetrical in the original matrix because of this property
    if length(IB)>1, % more than 1 vertex 
        if all(all(subM)) & issquare(subM), % all connected to all & square (i.e. 
            scc{end+1}=vertexnums(IB);
        else
        if M(IB)-M
    end
    ex=exclude(1:length(M),IB);
    M=M(ex,ex); % need it to still be square and have rows correspond to columns to evaluate symmetry
    vertexnums=vertexnums(ex);
end

