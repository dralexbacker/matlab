function vector=unpack(celda)
% LINEARIZECELL - Arranges contents of CELDA into a 1 dimensional cell
% Does not work yet
% Works for multi-d cells, and although matrices in it can be any dimension

celda=reshape(celda,1,prod(size(celda)));
vector=[];
for i=1:length(celda),
   if iscell(celda{i}),
      v=linearizecell(celda{i});
   else,
      v{1}=celda(i);
   end
   lv=length(vector);
   vector{lv+1}=v;
end

      