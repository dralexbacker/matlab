function string=replacechar(string,charout,charin)
% REPLACECHAR - Replace all occurrences of CHAROUT in STRING with CHARIN
% string = replacechar(string,charout,charin)
% AB Jun 01
%
% CHARIN & CHAROUT are strings of length 1
%
% See also STRREP, built-in exact equivalent for any length strings.

ind=findstr(charout,string);
string(ind)=charin;
