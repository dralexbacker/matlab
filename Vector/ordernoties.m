function orden = ordernoties(v)
% OrderNoTies - Yields rank (relative order) of each of the elements in v without leaving ranks empty because of ties
% AB Oct 00
% function orden = ordernoties(v)
% 
% See also ORDER

orden=[];
[s,sorden]=sort(v);
n=0;
i=1;
while i<=length(s),
   n=n+1;
   ind=find(s==s(i));
   rs(ind)=n;
   i=ind(end)+1;
end
orden(sorden)=rs;
