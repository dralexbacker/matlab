function list = separate(celda,separator)
% function list = separate(celda,separator)
% Yields a string with a list separated by SEPARATOR string (',' or space 
% most common) of all the elements in cell CELDA

list = [];
for i = 1:length(celda),
  list = [list,separator,celda{i}];
end
