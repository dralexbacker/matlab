function stripped = uniquify(matrix)
% function stripped = uniquify(matrix)
% Strips a matrix of repeated lines, returns unique lines in the order 1st encountered
% AB Mar 2000
% To quantify how many occurrences of each, use hist(matrix,largenumber)
% If MATRIX is a vector, UNIQUIFY calls UNIQUE, which is faster

if isempty(matrix),
   stripped=[];
else,
   
if any(size(matrix)==1),
   %stripped=uniquifyvector(matrix);
   stripped=unique(matrix);
else,
   %if size(matrix,1)==1
   %matrix = matrix';	% ensure that vectors get processed well no matter their orientation
stripped = matrix(1,:);
for i = 2:size(matrix,1),
   repeated=0;
   for j=1:size(stripped,1),
      if stripped(j,:)==matrix(i,:),
         repeated=1;
      end
  end
  if ~repeated,   
     stripped = [stripped;matrix(i,:)]; 
  end
end
end
end