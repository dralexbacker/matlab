function Nshared = Nshared(a,b)
% function Nshared = Nshared(a,b)
% Yields the number of shared elements between arrays A & B
% Will count an element repeated twice in A & 3 times in B as (# occurrences in A x # of rows of B in which it occurs)=# shared els
% If A is vector and B is scalar, Nshared is # of occurrences of B in A
% AB Jan 99
%
% See OVERLAP
%
% e.g. Nshared([0 0 0 1],0) = 3
% but Nshared(0,[0 0 0 1]) = 1

Nshared = 0;
for i = 1:size(a,1),
   for j = 1:size(a,2),
      for k = 1:size(b,1),
         if ~isempty(findstr(a(i,j),b(k,:))),
            Nshared = Nshared + 1;
         end
      end
   end
end

