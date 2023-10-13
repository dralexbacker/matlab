function [mat,diam]=reachability(mat)
% Yields reachability matrix of a graph
% See PATHS instead

[mat,diam]=paths(mat);
return;

% PATHS - Given a matrix representing the connectivity of a directed graph,
% yields a matrix M such that M(i,j)=1 if j is reachable from i and 0
% otherwise
% AB Nov 03
% Use fastpaths instead

lm=length(mat);
v=1:lm;
newmat=mat;
change=1;
while change,
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
    
    N=M.*ones(lm,1)*M(
    if ~isequal(mat,newmat),
        mat=newmat;
    else,
        change=0;
    end
end
