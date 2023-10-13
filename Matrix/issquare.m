function issquare=issquare(M)
% ISSQUARE - Yields 1 if input is a square matrix
% AB Nov 03

issquare=1-diff(size(M));
    