function [xy,p] = corrcoef(x,y)
%CORRCOEFAB Correlation coefficients. Based on CORRCOEF.
% Modified by AB to prevent from dividing by 0; will yield NaN in that case
% and to yield a p-value that the correlation xy(1,2) is significant. The latter assumes that the number of samples is large (N>500 or so)
% that x and y's tails die off sufficiently rapidly and that in the null hypothesis is that x and y are uncorrelated
%
%   [xy,p] = CORRCOEF(X) is a matrix of correlation coefficients formed
%   from array X whose each row is an observation, and each
%   column is a variable.
%   [xy,p] = CORRCOEF(X,Y), where X and Y are column vectors is the same as
%   CORRCOEF([X Y]).
%   
%   If C is the covariance matrix, C = COV(X), then CORRCOEF(X) is
%   the matrix whose (i,j)'th element is
%
%          C(i,j)/SQRT(C(i,i)*C(j,j)).
%
%   AB: If COV(X) or COV(Y)=0, returns NaN
%
%   See also COV, STD, SPEARMAN.

%   A. Backer Jun 01
%   J. Little 5-5-86
%   Revised 6-9-88 LS 2-13-95 BJ
%   Copyright 1984-2000 The MathWorks, Inc. 
%   $Revision: 5.7 $  $Date: 2000/06/01 02:10:42 $

switch nargin
case 1
  c = cov(x);
case 2
  c = cov(x,y);
otherwise
  error('Not enough input arguments.');
end

d = diag(c);
den=sqrt(d*d');
if den,
    xy = c./den;
else,
    xy = NaN*ones(size(c));
end

if nargout>1,
    r=xy(1,2);
    N=length(x);
    Ny=length(y);
    if Ny~=N,
        error('length(x) must equal length(y) in CORRCOEFAB')
    end
    p=erfc((abs(r)*sqrt(N))/sqrt(2));
end