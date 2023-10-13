function matrix = assigncols(matrix,colnums,column)
% ASSIGNCOLS - Assign COLUMN to columns COLNUMS of MATRIX
% AB Jul 00
% function matrix = assigncols(matrix,colnums,column)
%
% See also ASSIGNLINES

if size(column,2)>1,
   if size(column,1)==1,
      column=column';
      %warning('Input to ASSIGNCOLS should be column vector, transposing it...')
   else,
      error('Input to ASSIGNCOLS must be a vector')
   end
end

if ~exist('matrix','var'),
   matrix=[];
end

Ncols=length(colnums);
matrix(:,colnums)=column*ones(1,Ncols,1);