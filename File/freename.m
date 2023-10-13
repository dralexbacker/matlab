function fname = freename(fnamebase)
% FREENAME - Non-existing file name
% function freename = freename(fnamebase)
% Yields the first non-existing (in the pwd) filename of the form FNAMEBASENUM (e.g. FNAME1)
% AB Jul 00

[fnamebase,ext]=extension(fnamebase);
fname=fnamebase;
num=0;
while fexist([fname,'.',ext]),
   num=num+1;
   fname=[fnamebase,num2str(num)];
end
fname=[fname,'.',ext];