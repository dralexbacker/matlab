function shortname = dosname(filename)
% WIN95AD
% AB May 97
%		Converts filename to DOS filename
%		Assumes no two files share 1st six letters

s = size(filename); s = s(2);
if s>8,
	shortname = [filename(1:6),'~1'];
else
	shortname = filename;
end



