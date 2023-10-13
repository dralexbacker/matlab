function order = order(x)
% myORDER - Returns order, or rank, of elements of x, assigning ties the mean of all ranks in tie
% AB Sep 00
% Used by SPEARMAN
% Use ORDER instead, this version is my version and does not work yet

lx=length(x);
[sx,sxi]=sort(x);
order=1:lx;
if length(unique(x))<lx,
   for i=1:lx-1,
      if sx(i+1)==sx(i),
         j=1;
         while i+j+1<=lx & sx(i+j+1)==sx(i),
            j=j+1;
         end
         sharedrank=mean(i:i+j);
         order(i:i+j)=sharedrank;
      end
   end
end
order(sxi)=order;
