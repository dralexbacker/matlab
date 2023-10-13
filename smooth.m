function smoothed = smooth(matrix,stddev)
% function smoothed = smooth(matrix,stddev)
% Smooths each row of MATRIX with a gaussian of std dev STDDEV
% SMOOTH preserves the size of the original matrix
% AB Oct 97, realign moved 1 bin Aug 2000
%
% See also WRAPSMOOTH

hlk=3*ceil(stddev); % half (length of kernel -1)
x = [-hlk:hlk]; % ms
variance = stddev^2;% 	20 Hz means they all happen within +-25 ms, but they
		%	are usually more synchronized than that, so say 15 ms

nr = size(matrix,1); nc = size(matrix,2);
for row = 1:nr,
% Gaussian filtering, smoothing
smoothed(row,:) = conv(matrix(row,:),gaussian(x,variance));
end

% Realign smooth with trials from change in length because of convolution
smoothed = smoothed(:,hlk+1:nc+hlk);

