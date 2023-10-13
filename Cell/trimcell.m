function trimmed = trimcell(celda,minval,maxval,celda2)
% function trimmedcell = trimcell(celda,minval,maxval,celda2)
% TRIMCELL - Same as CROPCELL
% Keeps only values of CELDA for which the corresponding CELDA2 element is 
% contained in [MINVAL:MAXVAL]
% Note that CELDA2 can be equal to CELDA if selecting according to CELDA value (default)
% TRIMMED is a cell of the same size as CELDA
% AB Apr 2000

if ~exist('celda2','var') | isempty(celda2),
  celda2 = celda;
end
if ~exist('minval','var') | isempty(minval),
   minval=-Inf;
end
if ~exist('maxval','var') | isempty(maxval),
   maxval=Inf;
end

for tr = 1:length(celda),
   spinwin = find(celda2{tr}>=minval & celda2{tr}<=maxval);
   if isempty(spinwin),
     trimmed{tr}=[];
   else,
     trimmed{tr} = celda{tr}(spinwin);
   end
end
