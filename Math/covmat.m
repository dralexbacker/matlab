function covvector = covmat(matrix)
% COVMAT
% AB Oct 97
%		Gives covariance? of the odd rows of matrix vs. the 
%		corresponding (consecutive) even rows
%
%		Apr 98: I believe as a fn of column, usually time

s = size(matrix); s = s(1);
xcvector = 0;

for row = 1:2:s,
  xcvector = xcvector+xcorr(matrix(row,:),matrix(row+1,:),'unbiased');
end

% PSTH calculation; no binning
% psth1 is psth for cell 1, psth2 for cell 2, psth is total 
psth1 = sum(matrix(1:2:s,:))./(s/2);
psth2 = sum(matrix(2:2:s,:))./(s/2);

covvector = xcvector/(s/2) - xcorr(psth1,psth2,'unbiased');

% Normalization by variances to give -1 to 1 coeff corr
px = sum(psth1); py = sum(psth2);
div = ((px-px^2)*(py-py^2))^1/2;
covvector = covvector/div;
%xcvector = xcvector/(s/2);

