function strmat = cell2str(celda)
% CELL2STR   - Converts 1-dim celda of strings size(1,n) to a string array size(n,m) where m=max length of all strings in celda
% function strmat = cell2str(celda)
% AB May 00

lc=0; ml=0;
for i=1:length(celda),
   lc = length(celda{i});
   if lc>ml,
      ml=lc;
   end
end

for i=1:length(celda),
   	lc = length(celda{i});
   strmat(i,1:ml)=[celda{i},blanks(ml-lc)];
end
   