function trimmed = cropcell2d(celda,minval,maxval,celda2,minval3,maxval3,celda3)
% function trimmed = cropcell2d(celda,minval,maxval,celda2,minval3,maxval3,celda3)
% CROPCELL2D  - Same as TRIMCELL
% Keeps only values of CELDA for which the corresponding CELDA2 element is 
% contained in [MINVAL:MAXVAL] (default (-Inf:Inf)) & the corresponding CELDA3 element is 
% contained in [MINVAL3:MAXVAL3]
% Note that CELDA2 can be equal to CELDA if selecting according to CELDA value (default)
% TRIMMED is a cell of the same size as CELDA
% AB Jul 2000
%
% See also CUTCELL, CROPCELL

if ~exist('celda3','var') | isempty(celda3),
   celda3 = celda2;
   celda2=celda;
end
if ~exist('minval','var') | isempty(minval),
   minval=-Inf;
end
if ~exist('maxval','var') | isempty(maxval),
   maxval=Inf;
end
if ~exist('minval3','var') | isempty(minval3),
   minval3=-Inf;
end
if ~exist('maxval3','var') | isempty(maxval3),
   maxval3=Inf;
end

for tr = 1:length(celda),
   spinwin = find(celda2{tr}>=minval & celda2{tr}<=maxval & celda3{tr}>=minval3 & celda3{tr}<=maxval3);
   if isempty(spinwin),
     trimmed{tr}=[];
   else,
     trimmed{tr} = celda{tr}(spinwin);
   end
end
