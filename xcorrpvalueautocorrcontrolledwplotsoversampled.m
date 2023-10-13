function [pvaluepermuting1,pvaluepermuting2]=xcorrpvalueautocorrcontrolledwplotsoversampled(series1,series2,maxi,numtests,PLOT)
% [pvaluepermuting1,pvaluepermuting2]=xcorrpvalueautocorrcontrolledwplotsoversampled(series1,series2,maxi,numtests,PLOT)
% xcorrpvalueautocorrcontrolled Yields p value of the max absolute value of a cross correlation
% SERIES1 and SERIES2 are the two series cross-correlated, and MAXI is the
% max of their crosscorrelogram
% NUMTESTS (optional, default 100) is the # of tests to use
% PLOT is 1 to plot autocorrelation of each series and randomized series, 0 by default
% OVERSAMPLING (optional) draws more random samples than the original
% series by factor OVERSAMPLING in order to verify the accuracy of the
% autocorrelation match between random controls and original series. This
% parameter is useful if PLOT=1
%
% PVALUEPERMUTING1 is the p-value with random permutations of SERIES1,
% preserving SERIES2
% PVALUEPERMUTING2 is the p-value with random permutations of SERIES2,
% preserving SERIES1
% You want to use the great p-value of the two if you are looking for
% cross-correlations not due to either autocorrelation
% This function approximately preserves the autocorrelation of each series
% Copyright Alex Backer May 2020

if nargin<4,
    numtests=100;
end
if nargin<5,
    PLOT=0;
end
if nargin<6,
    OVERSAMPLING=1;
end

l1=length(series1);l2=length(series2);
count1=0;count2=0;randomizedseries1=[];randomizedseries2=[];
for i=1:numtests,
    [autocorrelation,lags]=xcorr(series1);
    
    if PLOT,
        figure(1);
        stem(lags,autocorrelation);
        title('Series 1 autocorrelation')
    end
    
    autocorrelation=abs(autocorrelation);
    ctrlautocorrelation=[];ctrlautocorrlags=[];
    for oversampling=1:OVERSAMPLING,
        for j=1:l1,
            sample=[];
            while isempty(sample) | j+sample<1 | j+sample>l1
                sample=datasample(lags,1,'Weights',autocorrelation); %,'Replace',false);
            end
            randomizedseries1(j)=series1(j+sample);
        end
        [xc,ctrllags]=xcorr(randomizedseries1,series2);
        %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
        maxc=max(abs(xc));
        if maxc>maxi,
            count1=count1+1;
        end
        
        [ctrlautocorrelation(oversampling,:),ctrlautocorrlags(oversampling,:)]=xcorr(randomizedseries1);
    end
      if PLOT,
        ctrlautocorrelationmean=mean(ctrlautocorrelation,1);
        ctrllagsmean=mean(ctrlautocorrlags,1);
          figure(2);
          stem(ctrllagsmean,ctrlautocorrelationmean);
        title('Randomized series 1 autocorrelation')
      end
      
    [autocorrelation,lags]=xcorr(series2);
    if PLOT,
        figure(3);
        stem(lags,autocorrelation);
        title('Series 2 autocorrelation')
    end
    
    autocorrelation=abs(autocorrelation);
%    randomizedseries2=series2+datasample(lags,l2,'Weights',autocorrelation,'Replace',false);
    ctrlautocorrelation=[];ctrlautocorrlags=[];
    for oversampling=1:OVERSAMPLING,
        for j=1:l2,
            sample=[];
            while isempty(sample) | j+sample<1 | j+sample>l2
                sample=datasample(lags,1,'Weights',autocorrelation); %,'Replace',false);
            end
            randomizedseries2(j)=series2(j+sample);
        end
        [xc,ctrllags]=xcorr(series1,randomizedseries2);
        %   [xc,lags]=xcorr(smooth(series1(randperm(l1))),series2);
        maxc=max(abs(xc));
        if maxc>maxi,
            count2=count2+1;
        end
        %
        [ctrlautocorrelation(oversampling,:),ctrlautocorrlags(oversampling,:)]=xcorr(randomizedseries2);
    end
    if PLOT,
        ctrlautocorrelationmean=mean(ctrlautocorrelation,1);
        ctrllagsmean=mean(ctrlautocorrlags,1);
        figure(4);
        stem(ctrllagsmean,ctrlautocorrelationmean);
        title('Randomized series 2 autocorrelation')
        pause
      end

end
pvaluepermuting1=count1/numtests/OVERSAMPLING;
pvaluepermuting2=count2/numtests/OVERSAMPLING;
