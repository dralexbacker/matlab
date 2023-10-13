function trimmed = cropcell2dpol(celda,celda2,x,y,celda3)
% function trimmed = cropcell2dpol(celda,minval,maxval,celda2,minval3,maxval3,celda3)
% CROPCELL2DPOL  - 
% Keeps only values of ea. CELDA element for which the corresponding CELDA2 & CELDA3 elements' values are 
% above the polynomial defined by the corresponding elements of datapoint pairs X & Y (also cells)
% Note that CELDA2 can be equal to CELDA if selecting according to CELDA value (default)
% TRIMMED is a cell of the same size as CELDA
% AB Jul 2000
%
% See also CUTCELL, CROPCELL, CROPCELL2D, CUTCELL2DLIN

if ~exist('celda3','var') | isempty(celda3),
   celda3 = celda2;
   celda2=celda;
end

for tr = 1:length(celda),
   spinwin = find(celda3{tr}>interpab(x{tr},y{tr},celda2{tr})); % above polynomial
   if isempty(spinwin),
     trimmed{tr}=[];
   else,
     trimmed{tr} = celda{tr}(spinwin);
   end
end
