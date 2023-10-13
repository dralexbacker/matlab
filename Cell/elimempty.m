function [noempties,ind]=elimempty(celda)
% Eliminate empty values in cel
% Copyright Alex Backer May 2020

ind=[];
for i=1:length(celda),
    if ~isempty(celda{i}),
        ind=[ind,i];
    end
end
noempties=celda(ind);
