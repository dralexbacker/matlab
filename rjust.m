function juststring = rjust(string,len)

% RJUST
% juststring = rjust(string,len)
% Right justifies a string to a total of len characters with leading spaces
% AB Mar 98

juststring = [blanks(len-size(string,2)),string];

