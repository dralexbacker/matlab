function newmat=tabdelimnodenames5(names,filename,DIRE,delimiter)
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

% maxwidth=0;
nn=length(names);
% for i=1:nn,
%     le=length(names{i});
%     if le>maxwidth,
%         maxwidth=le;
%     end
% end
maxdig=ceil(log(nn))+1;
numbers=1:nn;

p=pwd;
cd(DIRE);
fid = fopen(filename,'w');
s=['%d\t %s\r\n'];

for i=numbers,
    name=names{i};
    fprintf(fid,s,i,name);
end

fclose(fid);
cd(p)