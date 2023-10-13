function newmat=matrixtotabdelim(mat,filename,DIRE,delimiter)
% MATRIXTOTABDELIM - Converts MAT matrix into a text file named FILENAME in DIRE (default PWD), with
% a sparse representation of MAT, with columns:
% Index 1 (tab)   Index 2 (tab)    Value (carriage return+linefeed)
% (Windows format & VXOrd format)
% function matrixtotabdelim(mat,filename,DIRE)
% AB Apr 03
%
% See also SPARSE, FIND.

if nargin<3 | isempty(DIRE),
    DIRE=pwd;
end
if nargin<4 | isempty(delimiter),
    delimiter='\t';
end

[i,j,v] = find(mat);
newmat=[i(:),j(:),v(:)];
p=pwd;
cd(DIRE);
dlmwrite(filename,newmat,delimiter); 
cd(p)