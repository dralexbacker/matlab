function juststring = ljust(string,len)

% LJUST
% juststring = ljust(string,len)
% Left justifies a string to a total of len characters with trailing spaces
% AB Mar 98

juststring = [string(1:min(len,length(string))),blanks(len-size(string,2))];

