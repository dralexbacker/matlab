function [Neven,Nodd]=countpar(array)
% function [Neven,Nodd]=countpar(array)
% Returns count of even and odd integers in array
% AB Jan 99

Nodd = 0; Neven = 0;
for i = 1:size(array,1),
   for j = 1:size(array,2),
      if array(i,j)~=round(array(i,j)),
         error('Array contains non-integer numbers')
      else,
         if rem(array(i,j),2),
            Nodd = Nodd+1;
         else,
            Neven = Neven+1;
         end
      end
   end
end
