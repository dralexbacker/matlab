function [matrix,rowlabels]=list2matrix(matrix,rowlabels,list,attributematrix)
% Converts a series of 1-d string cells into a non-duplicating 1-d string
% cell and a numeric matrix
% ATTRIBUTEMATRIX is an optional matrix of size (length(list),N), with N
% the # of numerical attributes that each list entry has, e.g. the # of
% times a song was played or the rating it was given. If missing, a binary
% array of ones of length length(LIST) is used.

if nargin<4,
    attributematrix=ones(length(list),1);
end
if isemtpy(matrix),
    rowlabels=list;
    matrix(:,1,:)=attributematrix; %if no attribute matrix=ones(list,1);
else,
    column=size(matrix,2)+1;
    for i=1:length(list),
        posfound=findcell(rowlabels,list{i});
        if posfound,
            matrix(posfound,column,:)=attributematrix(i,:);
        else,
            rowlabels{end+1}=list{i};
            matrix(end+1,column,:)=attributematrix(i,:);
        end
    end
end

