function vector = selcell2vec(celda,minval,maxval,celda2)
% function vector = selcell2vec(celda,minval,maxval,celda2)
% SELected CELL to VECtor
% Converts 1-dim cell CELDA into a 1-dimensional vector with all the elements in CELDA
% Keeps only values of CELDA for which the corresponding CELDA2 element is 
% contained in [MINVAL:MAXVAL]
% Note that CELDA2 can be equal to CELDA if selecting according to CELDA value (default)
% AB Apr 2000
%
% See also CUTCELL, CROPCELL

if nargin<4,
    celda2=celda;
end

vector = []; % put all trials in one vector
for tr = 1:length(celda),
   spinwin = find(celda2{tr}>=minval & celda2{tr}<=maxval);
   vector = [vector,celda{tr}(spinwin)];
end
