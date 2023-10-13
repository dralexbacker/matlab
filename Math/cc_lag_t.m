function dum = cc_lag_t(matrix,maxlag,sd)
% CC_LAG_T
% AB Oct 97
%		Gives coeff of corr of the odd rows of matrix vs. the 
%		corresponding (consecutive) even rows, as a fn of lag and time
%		Lags range from -MAXLAG to +MAXLAG
%		The time window used to average enough data for each point is
%		gaussian with std dev SD

global chan_start chan_end resolution lagresol

s = size(matrix); tl = s(2);
winrad = 3*sd;

%xcvector = 0;
%for row = 1:2:s,
%  xcvector = xcvector+xcorr(matrix(row,:),matrix(row+1,:),'unbiased');
%end

% PSTH calculation; no binning
% psth1 is psth for cell 1, psth2 for cell 2, psth is total 
%psth1 = sum(matrix(1:2:s,:))./(s/2);
%psth2 = sum(matrix(2:2:s,:))./(s/2);

x = matrix(1:2:s,:); y = matrix(2:2:s,:);

for t = 1:resolution:tl,
mnlag = min(t-1,maxlag); mxlag = min(tl-t,maxlag);
for lag = -mnlag:lagresol:+mxlag,
%	winstart = max(1,t-winrad); winend = min(tl,t+winrad+lag);% t axis win
%	for bin = winstart:winend, % temporal averaging
%		c = corrcoef(x(:,bin),y(:,bin+lag));
		c = corrcoef(x(:,t),y(:,t+lag));
		cc((t-1)/resolution+1,(lag+maxlag)/lagresol+1) = c(1,2);
%		cc_lag_t(t) = c(1,2);
%	end
%keyboard
%	cc(t,lag+maxlag+1) = gaussian([-(t-winstart):+(winend-t)],sd^2).*cc_lag_t;
end
end
save cc cc chan_start chan_end sd
figure(1)
pcolor(t,lsg,cc')
keyboard