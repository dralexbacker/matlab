function cell = array2cell(array,numsets)

% ARRAY2CELL - Converts an array with rows i:numsets:end representing set i to a cell{i}
% function cell = array2cell(array,numsets)
% AB Apr 98
%
% array is the array to be converted
% numsets is the # of sets


for s = 1:numsets,
   cell{s} = array(s:numsets:size(array,1),:);
end
