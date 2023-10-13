function cc=degcorrcoef(mat)
% DEGCORRCOEF - Yields a graph's coefficient of correlation between the
% degree of the nodes on either end of each edge
% AB Nov 03

deg=sum(mat); % Degree of each node

s=size(mat);
edges=find(mat);

[i,j]=ind2sub(s,edges);
m=[deg(i);deg(j)]';
c=corrcoef(m);
cc=c(1,2);
