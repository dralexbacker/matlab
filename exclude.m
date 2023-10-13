function [remains,ind] = exclude(vector,excludevec,inclmin,inclmax)
% EXCLUDE - For vectors
% function [remains,ind] = exclude(vector,excludevec,inclmin,inclmax)
% AB Jun 00
%
% See also EXCLUDEMAT, slower version that works for matrices too

remains=vector;
if exist('excludevec','var') & ~isempty(excludevec),
   ind=[1:length(vector)];
   for i=1:length(excludevec),
      if ~isempty(remains),
         j=find(remains~=excludevec(i));
      	remains = remains(j);
         ind=ind(j);
      end
   end
else,
   if ~exist('inclmin','var') | isempty(inclmin),
      inclmin = -Inf;
   end
   if ~exist('inclmax','var') | isempty(inclmax),
      inclmax = Inf;
   end
   ind=find(vector>=inclmin & vector<=inclmax);
   remains = vector(ind);
end
