function str=elimchar(string,char)
% ELIMCHAR - Eliminate all occurrences of CHAR from STRING
% elimchar(string,char)
% AB Jun 01

ind=findstr(char,string);
if ~isempty(ind),
    str=[string(1:ind(1)-1)];
    for i=2:length(ind),
        str=[str,string(ind(i-1)+1:ind(i)-1)];
    end
    str=[str,string(ind(end)+1:end)];
else,
    str=string;
end