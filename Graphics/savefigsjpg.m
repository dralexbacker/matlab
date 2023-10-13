function savefigsjpg(n,path)
% saveFIGSjpg - Saves figures defined by N vector as JPG
% AB Mar 04
% savefigs(n,path)

if nargin<2,
    path=pwd;
end
if ispc & ~isequal(path(end),'\'),
    path=[path,'\'];
end

for i=n,
   h=figure(i);
    set(gcf, 'InvertHardCopy', 'off');
    print(h,'-djpeg',[path,'fig',int23digstr(i),'.jpg'])
end
