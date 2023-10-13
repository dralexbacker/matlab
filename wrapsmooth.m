function smoothed = wrapsmooth(matrix,stddev)
% WRAPSMOOTH
% function smoothed = wrapsmooth(matrix,stddev)
% Smooths each row of MATRIX with a gaussian of std dev STDDEV wrapping each line of MATRIX 
% around the edges preserving continuity from MATRIX(:,end) to MATRIX(:,1)
% WRAPSMOOTH preserves the size of the original matrix
% AB Jun 00
%
% See also SMOOTH

if isempty(matrix),
   smoothed=[];
else,
   
hlk=3*ceil(stddev); % half length of kernel -1
x = [-hlk:hlk]; % ms
variance = stddev^2;% 	20 Hz means they all happen within +-25 ms, but they
		%	are usually more synchronized than that, so say 15 ms
      
wmatrix = [matrix(:,end-hlk+1:end)';matrix';matrix(:,1:hlk)']';

nr = size(matrix,1); nc = size(matrix,2);
for row = 1:nr,
% Gaussian filtering, smoothing
smoothed(row,:) = conv(wmatrix(row,:),gaussian(x,variance));
end

% Realign smooth with trials from change in length because of convolution
smoothed = smoothed(:,2*hlk+1:nc+2*hlk);

if size(smoothed)~=size(matrix),
   error('WRAPSMOOTH not preserving size')
end
end