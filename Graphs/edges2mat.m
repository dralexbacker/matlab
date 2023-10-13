function [mat,names]=edges2mat(filename,direc,dlm)
% EDGES2MAT - Convert 2-column file with graph edges to a connectivity matrix
% function [mat,names]=edges2mat(filename,direc,dlm)
% AB Nov 03
%
% DLM = delimiter (default= \t)

if nargin<3,
    dlm='\t';
end
if nargin<2,
    cd 'C:\My data\Proteins\Ito 2001'
else,
    cd(direc)
end

if min(size(filename))==1,
    [m, cel] = dlmreadab(filename,dlm);
else
    cel=filename;
end

Nedges=size(cel,1);
[names,i,j]=unique(cel);
origins=j(1:end/2);
%targets=j(end/2+1:end);
%mat=repmat(false, Nedges);
for namenum=1:length(names),
    namenumedges=find(origins==namenum);
%    neighbornames=cel(namenumedges,2);
    neighbornums=j(Nedges+namenumedges); % same as targets(namenumedges);
    mat(namenum,neighbornums)=true;
end
mat=sparse(mat);
