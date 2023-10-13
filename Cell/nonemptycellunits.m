function [count,newcel,indexes]=nonemptycellunits(cel)
if min(size(cel))>1 | length(size(cel))>2,
    error('CountNONemptyCELLunits only supports linear cell arrays.')
end

newcel={};indexes=[];count=0;
for i=1:length(cel),
    if ~isempty(cel{i}),
        count=count+1;
        newcel=[newcel;cel(i)];
        indexes=[indexes;i];
    end
end
