function [index,odlist]=placeinlist(element,odlist);
% If ELEMENT is in ODLIST, returns the index of ODLIST that contains ELEMENT in INDEX
% If it is not, adds ELEMENT to ODLIST and returns INDEX=0
% AB Nov 01
% [index,odlist]=placeinlist(element,odlist);
%
% Reason for returning zero is to differentiate between new entry or not, some programs need this
% 
% See also INLIST

index=inlist(element,odlist);
if ~index,
    odlist{end+1}=element;
end