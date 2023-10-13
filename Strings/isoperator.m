function is=isoperator(c)
% ISOPERATOR - Returns true if c is operator
% function is=isoperator(c)
% AB Apr 03

v=' +-=/;,]})*/.^><&|~:@[{(';
    
if ~isempty(findstr(c,v)),
    is=1;
else,
    is=0;
end
