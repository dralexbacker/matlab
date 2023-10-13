function [p, h] = ranksuma(x,y,alpha)

if nargin < 3
   alpha = 0.05;
end

[nx, colx] = size(x);
[ny, coly] = size(y);

if min(nx, colx) ~= 1 | min(ny,coly) ~= 1,
   error('RANKSUM requires vector rather than matrix data.');
end 
if nx == 1
   nx = colx;
   x = x';
end
if ny == 1,
   ny = coly;
   y = y';
end

if nx <= ny
   smsample = x;
   lgsample = y;
   ns = nx;
   nl = ny;
else
   smsample = y;
   lgsample = x;
   ns = ny;
   nl = nx;
end

sz = sort([x; y]);
tiescor = 0;   
for idx = 1:ns
   tmp = find(sz == smsample(idx));
   nties = length(tmp);
   if nties > 1
      xrank(idx) = mean(tmp);
      tiescor = tiescor + (nties.^2-1)./((nx+ny)*(nx + ny - 1));
   else
      xrank(idx) = tmp;
   end
end
for idx = 1:nl
   tmp = find(sz == lgsample(idx));
   nties = length(tmp);
   if nties > 1
      tiescor = tiescor + (nties.^2-1)./((nx+ny)*(nx + ny - 1));
   end
end   
w = sum(xrank);

wmean = ns*(nx + ny + 1)/2;
wvar  = nx*ny*((nx + ny + 1) - tiescor)/12;
if ns < 10 & (nx+ny) < 20     % Use the sampling distribution of W.
   allpos = nchoosek(1:nx+ny,ns);
   sumranks = sum(allpos')';
   np = length(sumranks);
   if w < wmean
      p = (2*length(find(sumranks < w)) + 0.5)./(np+1);
   else 
      p = (2*length(find(sumranks > w)) + 0.5)./(np+1);
   end
   %lbcrit = prctile(sumranks,100*alpha/2)   Critical values for Wilcoxon statistic.
   %ubcrit = prctile(sumranks,100*(1-alpha/2)) Critical values for Wilcoxon statistic.
else    % Use the normal distribution approximation of W.
	z = (w-wmean)/sqrt(wvar);
	p = normcdf(z,0,1);
	p = 2*min(p,1-p);
end

if nargout == 2,
   h = (p<alpha/2) + ((1-p)<alpha/2);
end
