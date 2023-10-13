function true = larger(filename,SIZE)
%function true = larger(filename,SIZE)
% True if file named FILENAME exists in current directory AND is larger than SIZE bytes
% AB Aug 99

d=dir(filename);
if ~isempty(d) & d.bytes>SIZE,
 true = 1;
else,
 true = 0;
end
