function celda = cellprod(celda,factor,ROUND)
% CELLPROD - Multiplies a linear cell by a scalar
% function prod = cellprod(celda,factor,ROUND)
% CELDA is the cell
% FACTOR is the scalar
% If ROUND is TRUE, elements are rounded to integers.
% AB Jul 00

if ~exist('ROUND','var'),
   ROUND=0;
end

for i=1:length(celda),
   if iscell(celda{i}),
      celda{i}=cellprod(celda{i},factor);
   else,
      if ~ischar(celda{i}),
         celda{i}=celda{i}*factor;
         if ROUND,
            celda{i}=round(celda{i});
         end
      end
   end
end
