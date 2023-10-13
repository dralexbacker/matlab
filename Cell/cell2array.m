function array=cell2array(celda)
% array=cell2array(celda)
% Converts 1-D cell into array
% Copyright Alex Backer May 2020

if min(size(celda))>1,
    error('CELL2ARRAY requires one-dimensional cells')
end

array=zeros(size(celda));
for i=1:length(celda),
    array(i)=str2double(celda{i});
end
