function vector=unpack(celda)
% UNPACK
% vector=unpack(celda)
% Yields a vector with all elements in CELDA
% AB Jun 00
% Works for multi-d cells, and although matrices in it can be any dimension

celda=reshape(celda,1,prod(size(celda)));
vector=[];
for i=1:length(celda),
   if iscell(celda{i}),
      v=unpack(celda{i});
   else,
      v=reshape(celda{i},1,prod(size(celda{i})));
   end
   vector=[vector,v];
end

      