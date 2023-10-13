function matrix = assignlines(matrix,linenums,line)
% ASSIGNLINES - Assign LINE to lines LINENUMS of MATRIX
% AB Jul 00
% function matrix = assignlines(matrix,linenums,line)
%
% See also ASSIGNCOLS

if size(line,1)>1,
   if size(line,2)==1,
      line=line';
      %warning('Input to ASSIGNLINES should be line vector, transposing it...')
   else,
      error('Input to ASSIGNLINES must be a vector')
   end
end

if ~exist('matrix','var'),
   matrix=[];
end

Nlines=length(linenums);
matrix(linenums,:)=ones(Nlines,1)*line;