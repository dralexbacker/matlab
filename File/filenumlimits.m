function [minn,maxn]=filenumlimits(ndig)
% FILENUMLIMITS - Yields 1st and last numbers 
% AB Jul 00
% [first,last]=filenumlimits(ndig)
%
% Looks for NDIG last characters in non-extension part of filenames, and selects the largest and smallest
% If none are numbers, returns [Inf 0]

d=dir;
le=length(d);

maxn=0;
minn=Inf;
for i=1:le,
   [pref,ext]=extension(d(i).name);
  if length(pref)>=ndig,
   ndigtr=0;
   while pref(end-ndigtr)>='0' & pref(end-ndigtr)<='9',
      ndigtr=ndigtr+1;
   end
   num=str2num(pref(end-ndigtr+1:end));
   if ~isempty(num) & num>maxn,
      maxn=num;
   end
   if ~isempty(num) & num<minn,
      minn=num;
   end
  end
end
