function is=isalphanumeric(c)
% ISALPHANUMERIC - Returns 1 if character input is alphanumeric (A-z letter or
% number), 0 otherwise
% AB Apr 03
%
% See also CHAR, DOUBLE

d=double(c);
% [48:57,65:90,97:122] are alphanumeric
if (d>=48 & d<=57) | (d>=65 & d<=90) | (d>=97 & d<=122),
    is=1;
else
    is=0;
end