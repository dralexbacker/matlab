function res = order(x)
% ORDER - Returns order, or rank, of elements of x, assigning ties the mean of all ranks in tie
% AB Sep 00
% Used by SPEARMAN
% From Numerical Recipes in C, p. 642

n=length(x);
[w,sxi]=sort(x);
j=1;
while j<n,
   if w(j+1)~=w(j),
      w(j)=j;
      j=j+1;
   else,
      jt=j+1;
      while jt<=n & w(jt)==w(j),
         jt=jt+1;
      end
      rank=0.5*(j+jt-1);
      for ji=j:jt-1,
         w(ji)=rank;
      end
      t=jt-j;
      j=jt;
   end
end
if j==n, 
   w(n)=n;
end
res(sxi)=w;
      