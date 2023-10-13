function dum = movefile(source,dest)
% Moves a file from path&filename source to pathname dest using UNIX mv cmd
% AB May 98

if ispc,
    eval(['!rename ',source,' ',dest])
else,
    eval(['!mv ''',source,''' ''',dest,''''])
end
dum = 1;
