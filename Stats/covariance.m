function covar=covariance(rast1,rast2,maxlag,winsize,interval,laginterval,NORMALIZE,sd)
% COVARIANCE
% AB Nov 01
%
% rast(tr,:)

NORMALIZE=0; % normalized below at bottom

if nargin<8,
    sd=5;
end

Ntr=size(rast1,1);
if size(rast2,1)~=Ntr,
    error('rast1 & rast2 must be the same size')
end

psth1=smooth(mean(rast1),sd);
psth2=smooth(mean(rast2),sd);

xc=xcorrdifflagwin(psth1,psth2,maxlag,winsize,interval,laginterval,NORMALIZE);

covar=0;
for tr=1:Ntr,
    covar=covar+xcorrdifflagwin(rast1(tr,:),rast2(tr,:),maxlag,winsize,interval,laginterval,NORMALIZE);
end
covar=covar/Ntr;

covar=covar-xc;

% Normalization by variances to give -1 to 1 coeff corr
px = sum(psth1); py = sum(psth2);
div = ((px-px^2)*(py-py^2))^1/2;
covar = covar/div;
