function [mat,diameter]=paths(mat)
% PATHS - Given a matrix representing the connectivity of a graph,
% yields a matrix M such that M(i,j)=1 if j is reachable from i and 0
% otherwise. Also yields the graph diameter (length of the longest path)
%
% The algorithm works both for directed and undirected graphs
%
% function [mat,diameter]=paths(mat)
% AB Nov 03

% If the farthest two vertices are desired (or one of the farthest pairs in the case of a tie), simply store the last non-empty values of
% k,j. Finding the actual longest path is also just a matter of keeping
% track, for each starting vertex, of the tree of all paths, and then going
% back up from the vertex at the longest root of the tree to list the path

% If the edges have unequal lengths, and we wish Euclidean distance, just
% start with matrix with Inf, replace | with min, and add edge lengths to
% distance to previous vertex

v=1:length(mat);
diameter=0;
if any(any(mat)),
    newmat=mat;
    change=1;
    while change,
        diameter=diameter+1;
        %[i,j]=find(mat);
        
        %N(i,:)=any(mat(j,:));
        %newmat=M | N; 
        for k=v,
            neighbors=find(mat(k,:));
            [i,j]=find(mat(neighbors,:)); % My friends' friends...
            newmat(k,j)=1; % ...are my friends, too
            %newmat(k,:)=mat(k,:) | any(mat(
            %newmat(i(k),:)=mat(i(k),:) | any(mat(find(mat(j(k),:)),:));
        end
        if ~isequal(mat,newmat),
            mat=newmat;
        else,
            change=0;
        end
    end
end
