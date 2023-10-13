function done = asc2bin()
% function done = asc2bin()
% Converts all .MAT files in pwd from present format to binary
% AB May 98

d = dir;
nf = length(d);
for f = 1:nf,
   if d(f).isdir == 0 and d(f).name(length(d(f).name)-4:length(d(f).name))~='.mat',
      load(d(f).name);
      delete(d(f).name);
      save(d(f).name,d(f).name);
   end
end
