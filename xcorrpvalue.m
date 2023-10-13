function [pvaluepermuting1,pvaluepermuting2]=xcorrpvalue(series1,series2,maxi,numtests)
%xcorrpvalue Yields p value of the max absolute value of a cross correlation
% SERIES1 and SERIES2 are the two series cross-correlated, and MAXI is the
% max of their crosscorrelogram
% NUMTESTS (optional, default 100) is the # of tests to use
% Copyright Alex Backer May 2020

if nargin<4,
    numtests=100;
end
l1=length(series1);
count1=0;count2=0;
for i=1:numtests,
     [xc,lags]=xcorr(series1(randperm(l1)),series2);
  %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
     maxc=max(abs(xc));
     if maxc>maxi,
         count1=count1+1;
     end
  
     [xc,lags]=xcorr(series1(randperm(l1)),series2);
  %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
     maxc=max(abs(xc));
     if maxc>maxi,
         count2=count2+1;
     end

end
pvaluepermuting1=count1/numtests;
pvaluepermuting2=count2/numtests;
