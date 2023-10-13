function num = nextfile(filenamestr)

% Yields number of files+1 in the current directory whose first characters are filenamestr  
% AB Jul 98

le = length(filenamestr);
d = dir;
nmatches = 0;
for i = 1:length(d),
   nc = min(length(d(i).name),le);
   if d(i).name(1:nc)==filenamestr(1:nc),
      nmatches = nmatches+1;
   end
end   
num = nmatches+1;

