function num=str2numab(str)
% Converts a number string of length 1 into its corresponding number: str2numab('2')=2
% AB Nov 01
%
% See also str2num (built-in)

num=double(str)-48;
% int & unit do not have minus defined