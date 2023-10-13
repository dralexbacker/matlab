function [pvaluepermuting1,pvaluepermuting2]=xcorrpvalueautocorrcontrolled(series1,series2,maxi,numtests)
%xcorrpvalueautocorrcontrolled Yields p value of the max absolute value of a cross correlation
% SERIES1 and SERIES2 are the two series cross-correlated, and MAXI is the
% max of their crosscorrelogram
% NUMTESTS (optional, default 100) is the # of tests to use
% This function preserves the autocorrelation of each series
% Copyright Alex Backer May 2020

if nargin<4,
    numtests=100;
end
l1=length(series1);l2=length(series2);
count1=0;count2=0;
for i=1:numtests,
    [autocorrelation,lags]=xcorr(series1);
    autocorrelation=abs(autocorrelation);
    for j=1:l1,
        sample=[];
        while isempty(sample) | series1(j)+sample<1 | series1(j)+sample>l1
            sample=datasample(lags,1,'Weights',autocorrelation); %,'Replace',false);
        end
        randomizedseries1(j)=series1(j)+sample;
    end
    [xc,lags]=xcorr(randomizedseries1,series2);
  %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
     maxc=max(abs(xc));
     if maxc>maxi,
         count1=count1+1;
     end
  
    [autocorrelation,lags]=xcorr(series2);
    autocorrelation=abs(autocorrelation);
%    randomizedseries2=series2+datasample(lags,l2,'Weights',autocorrelation,'Replace',false);
    for j=1:l2,
        sample=[];
        while isempty(sample) | series2(j)+sample<1 | series2(j)+sample>l2
            sample=datasample(lags,1,'Weights',autocorrelation); %,'Replace',false);
        end
        randomizedseries2(j)=series2(j)+sample;
    end
     [xc,lags]=xcorr(series1,randomizedseries2);
  %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
     maxc=max(abs(xc));
     if maxc>maxi,
         count2=count2+1;
     end

end
pvaluepermuting1=count1/numtests;
pvaluepermuting2=count2/numtests;
