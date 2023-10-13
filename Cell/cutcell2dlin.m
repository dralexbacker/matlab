function trimmed = cutcell2dlin(celda,celda2,x,y,celda3)
% function trimmed = cutcell2dlin(celda,minval,maxval,celda2,minval3,maxval3,celda3)
% CUTCELL2DLIN  - Opposite of CROPCELL2DLIN
% Removes only values of CELDA for which the corresponding CELDA2 & CELDA3 elements are 
% above the line defined by X & Y
% Note that CELDA2 can be equal to CELDA if selecting according to CELDA value (default)
% TRIMMED is a cell of the same size as CELDA
% AB Jul 2000
%
% See also CUTCELL, CROPCELL, CROPCELL2D

if ~exist('celda3','var') | isempty(celda3),
   celda3 = celda2;
   celda2=celda;
end

for tr = 1:length(celda),
   spinwin = find(~aboveline(celda2{tr},celda3{tr},x,y));
   if isempty(spinwin),
     trimmed{tr}=[];
   else,
     trimmed{tr} = celda{tr}(spinwin);
   end
end
