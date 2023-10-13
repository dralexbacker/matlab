function vector=nondiag(matrix)
% vector=nondiag(matrix)
% Returns a vector with all elements in MATRIX except for those in the main diagonal
% AB Sep 01
%
% Elements both on the diagonal and outside of it will be returned as many times as they are present off the diagonal

vector=matrix(:);
dia=diag(matrix);
for i=1:length(dia),
    ind=find(vector==dia(i));
    if ~isempty(ind),
        vector(ind(1))=[];
    end
end
