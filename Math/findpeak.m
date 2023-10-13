function peak = findpeak(data,peaknum)
% FINDPEAK - If Peaknum==1, finds approx. mode of data.
% In general, finds abscissa value (not frequency) of PEAKNUM highest peak in histogram of DATA
% function peak = findpeak(data,peaknum)
% AB Mar 00
%
% See also MODE, EXACTMODE

stdev = 2; % was 2 for sensor analysis
histresol = 50;

[n,x]=hist(data,histresol); % n freq, x bin centers
smn = smooth(n,stdev);  % smooth n
smn = [smn,0];
dn = diff(smn);  % diff n
%dn = [dn(1),dn];
zx = zxings(dn);

htzx = smn(zx);  % height zero-xing
i=1;
while i<peaknum,
  pkind = find(htzx==max(htzx));
  htzx = htzx([1:pkind-1,pkind+1:end]);
  zx = zx([1:pkind-1,pkind+1:end]);
  i=i+1;
end

pkind = find(htzx==max(htzx));  % peak index
peak = x(zx(pkind)-1);

% If no secondary peak, peak is 0 (i.e. 2nd peak value is same as 1st, and so peak deviation is 0
if isempty(peak),
  peak = 0;
end
