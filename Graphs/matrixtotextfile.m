function newmat=matrixtotextfile(mat,filename,DIRE)
% MATRIXTOTEXTFILE - Converts MAT matrix into a text file named FILENAME in DIRE (default PWD), with
% a sparse representation of MAT, with columns:
% Index 1   Index 2     Value
% function matrixtotextfile(mat,filename,DIRE)
% AB Apr 03
%
% See also SPARSE, FIND.

if nargin<3 | isempty(DIRE),
    DIRE=pwd;
end

[i,j,v] = find(mat);
ndnode=ceil(log10(max(max(i),max(j)))+1);
ndstrength=ceil(log10(max(v))+1);
newmat=[i(:),j(:),v(:)];
p=pwd;
cd(DIRE);
s=['%',num2str(ndnode),'.0d %',num2str(ndnode),'.0d % ',num2str(ndstrength),'.0d\n'];
fid = fopen(filename,'w');
fprintf(fid,s,newmat');
fclose(fid);
%save(filename,mat2str(newmat),'-ascii') % SAVE saves variables, not text
cd(p)