% These are remains of program part meant to derive a vector

%fpint = bandpass(pint,1000,5,55); 
% or convolve with gaussian
subfactor =10;
fpint = decimate(pint,subfactor);
fX = decimate(X,subfactor);
p = diff(fpint); % graddata(fpint,fX);

%   if random,
 %     hold on
  %    plot(fX(2:end),p,'o--');
   %else,
    %  hold off
     % plot(fX(2:end),p,'s-');
   %end
