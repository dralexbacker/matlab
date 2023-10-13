function exists = fexist(filename)

% function exists = fexist(filename)
% Yields TRUE if filename exists in current directory and FALSE if not
% AB Oct 99

if findstr('/',filename),
  fn = postslash(filename);
  dire = filename(1:length(filename)-length(fn));
  cd(dire)
  filename = fn;
end


exists = 0;
d = dir;
for i = 1:size(d,1),
  exists = strcmp(d(i).name,filename);
  if exists,
    break
  end
end
