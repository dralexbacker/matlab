function len=lengthofprogram(filename)

filename=[filename,'.m'];
fid = fopen('filename');
A = fscanf(fid,'%s')
fclose(fid);
len=length(A); %-length(strfind(A,';')) % use this to not count certain characters
