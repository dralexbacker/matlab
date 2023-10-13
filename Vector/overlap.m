function [aoverlap,boverlap] = overlap(a,b)
% function [aoverlap,boverlap] = overlap(a,b)
% Yields shared elements between arrays A & B
% If A or B are matrices, will operate on columns (will convert non-matching *elements*, not rows, to zero)
% AB Jan 99
%
% See INTERSECT, a MATLAB function with the same purpose. See also NSHARED and FINDROWS.
%
% AOVERLAP is A with non-shared elements replaced by zeros
% BOVERLAP is B with non-shared elements replaced by zeros

overa = zeros(size(a)); 
overb = zeros(size(b)); 
for i = 1:size(a,1),
   for j = 1:size(a,2),
      for k = 1:size(b,1),
         m = findstr(a(i,j),b(k,:));
         if ~isempty(m),
            overa(i,j) = 1;
            overb(k,m) = 1;
         end
      end
   end
end

aoverlap = overa.*a;
boverlap = overb.*b;

