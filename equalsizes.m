function [equal,subindexv] = equalsizes(celda,c2)
% EQUALSIZES - Returns TRUE if all elements of CELDA & C2 are equal in sizes. Searches recursively.
% [equal,subindexv]= equalsizes(celda,c2)
%
% EQUAL = 1 if both matrices are the same size in every element, 0 otherwise
% if EQUAL=0, SUBINDEXV gives the subindex of the first mismatching element recursively, starting with
%   the subindex of the large cell itself, otherwise returns empty
% AB Jul 00

% Modified from UNPACK

subindexv=[];
for i=1:length(celda),
   if iscell(celda{i}),
      [equal,subindexv]=equalsizes(celda{i},c2{i})
      dif=~equal;
      if dif,
         subindexv=[i,subindexv];
      end
   else,
      if isequal(size(celda{i}),size(c2{i})),
         dif=0;
      else,
         dif=1;
         subindexv=i;
      end
   end
   if dif,
      break
   end
end
equal=~dif;