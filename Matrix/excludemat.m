function [remains,order] = excludemat(matrix,excludelinesmat)
% EXCLUDEMAT
% AB Jun 00
% function [remains,order]= excludemat(matrix,excludelinesmat)
%
% ORDER contains the line #'s that each line of REMAINS occupied in MATRIX
%
% See also EXCLUDE, a faster version for excluding scalars from vectors

remains=[]; order=[];
nlin = size(matrix,1);
for lin = 1:nlin,
   excl=0;
   for i=1:size(excludelinesmat,1),
      if isequal(matrix(lin,:),excludelinesmat(i,:)),
         excl = 1;
      end
   end
   if ~excl,
      remains = [remains;matrix(lin,:)];
      order = [order,lin];
   end
end
