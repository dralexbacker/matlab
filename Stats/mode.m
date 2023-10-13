function modo = mode(vector,Nbins,iter)
% function modo = mode(vector,Nbins,iter)
% AB Jul 98
% Yields the mode of a series of numbers in vector with a precision of 1/Nbins the range of vector
%  Default precision of 1/10th the range in vector using HIST
%
% See also EXACTMODE, FINDPEAK

maxiters=6; % Max # of recursive iterations

if ~exist('Nbins'),
 Nbins = 10;
end
if ~exist('iter','var'),
   iter=1;
end

mv=max(vector);
if isinf(mv) | isnan(mv),
   modo=mv;
else,
   [N,V]=hist(vector,Nbins);
	modo = V(find(N==max(N)));
   if length(modo)>1, % resolve ties by improving resolution
      if iter<maxiters,
         iter=iter+1;
         modo=mode(vector,Nbins*2,iter);
      else,
         modo=modo(1);
      end
	end
end
