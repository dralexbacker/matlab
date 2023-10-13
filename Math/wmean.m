function wmean = wmean(matrix, weights)
% WMEAN- Yields weighted mean of each column in MATRIX where ea. line is weighted by the corresponding element of WEIGHTS
% function wmean = wmean(matrix, weights)
% AB Aug 99, corrected Jun 00

%wmean=sum(weights.*matrix)/sum(weights); % for vectors

weights=reshape(weights,1,length(weights));
wmean=(weights*matrix)/sum(weights); % for matrix

