function args=fnargnames(line1)
% FNARGNAMES(line1)
% AB Apr 03
% Yields names of argument names for function whose first line is LINE1
%
% See TEXTREAD & FUNCTIONCALLTREE if you don't have LINE1

args={};
f=findstr('function',line1);
if isempty(f),
    return;
end
openp=findstr('(',line1);
closep=findstr(')',line1);
if openp>=closep,
    return;
end
arglist=line1(openp+1:closep-1);
arglist=elimchar(arglist,' ');
commas=findstr(',',arglist);
commas=[0,commas,length(arglist)+1];
for c=1:length(commas)-1,
    args{c}=arglist(commas(c)+1:commas(c+1)-1);
end

