function savefigs(n,path)
% saveFIGS - Saves figures defined by N vector as BMP
% AB Aug 01
% savefigs(n,path)

if nargin<2,
    path=pwd;
end
if ispc & ~isequal(path(end),'\'),
    path=[path,'\'];
end

for i=n,
   h=figure(i);
   %orient tall
    saveas(h,[path,'fig',num2str(i),'.bmp'],'bmp')
end
