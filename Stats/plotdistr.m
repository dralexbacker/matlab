function plotdistr(x,y)
% PLOTDISTR - Plot distributions of x & y in subplots to compare them and see whether they are normal, etc.
% plotdistr(x,y)
% AB Sep 01

np=mean(length(x)+length(y));
nbins=floor(np/5);
figure
subplot(2,1,1)
colorhist(x,nbins,'k')
subplot(2,1,2)
colorhist(y,nbins,'r')
