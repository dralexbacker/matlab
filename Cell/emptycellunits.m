function [count,indexes]=emptycellunits(cel)
if min(size(cel))>1 | length(size(cel))>2,
    error('CountEmptyCELLunits only supports linear cell arrays.')
end

indexes=[];count=0;
for i=1:length(cel),
    if isempty(cel{i}),
        count=count+1;
        indexes=[indexes;i];
    end
end
