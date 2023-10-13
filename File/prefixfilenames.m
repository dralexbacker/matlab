function prefixfilenames(prefix)
% PREFIXFILENAMES - Adds PREFIX to all filenames in PWD
% AB Jul 02
% function prefixfilenames(prefix)

d=dir;
l=length(d);
for i=3:l,
    fname=d(i).name;
    newfname=[prefix,fname];
    movefile(fname,newfname);
end
