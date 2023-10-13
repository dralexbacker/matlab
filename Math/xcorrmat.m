function xcvector = xcorrmat(matrix)
% XCORRMAT
% AB May 97
%		Gives xcorr of the odd rows of matrix vs. the 
%		corresponding (consecutive) even rows

s = size(matrix); s = s(1);
xcvector = 0;

for row = 1:2:s,
  xcvector = xcvector+xcorr(matrix(row,:),matrix(row+1,:),'unbiased');
end

xcvector = xcvector/(s/2);

