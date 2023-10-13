function nn=knnfractional(distances,labels,k)
% Fractional KNN - Returns the label of the fractional k-nearest neighbor
% i.e. the label with the largest fraction of its points among the k closest neighbors
% AB Sep 01
%
% DISTANCES is a vector with distance between the point to classify and each other point
% LABELS is a vector of same length as DISTANCES with the label for each point
% k is the number of neighbors to use
%
% If point to classify is in a small part of the overall region spanned by its class it may be better to use KNN,
% particularly if the area spanned by the true class may be non-spherical. See also KNN. 

[sorteddist,indlabels]=sort(distances);

% Don't break in the middle of a tie arbitrarily:
while k<length(sorteddist) & sorteddist(k)==sorteddist(k+1),
    k=k+1;
end
    
touse=labels(indlabels(1:k));
u=unique(touse);
lu=length(u);
if lu>1,
    n=hist(touse,u); % hist is fine xq there are only values in u, & each point *will* fall in the bin for which it is center
    for i=1:length(u),
        ntot(i)=length(find(labels==u(i)));
    end
    n=n./ntot; % convert to fractional
    maxind=find(n==max(n));
    if length(maxind)==1,
        nn=u(maxind);
    elseif k>=lu,
        nn=u(maxind(1)); % if using maximum k already, return the first of the tying answers
    else,
        nn=knn(distances,labels,k+1); % if tie, recursively call again with k=k+1
    end
else,
    nn=u;
end

% if k is small compared to length(distances), it might be faster to find min, removing and finding min again k times:
%    temp = find(distances == min(distances));
