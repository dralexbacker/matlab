function done=functions(x,stddev)]
% Matlab Function w/ Definitions of Common Functions for a given x
% Incl. Gaussian, DOG, 2ndDOG, GABOR_SIN, GABOR_COS

% Function definitions
global GAUSSIAN GAUSSIAN_1ST_DER GAUSSIAN_2ND_DER GABOR_SIN GABOR_COS;
GAUSSIAN=(1/sqrt(2*pi*stddev)*exp(-x.^2/2/stddev);
GAUSSIAN_1ST_DER= -1/stddev*x.*GAUSSIAN;
GAUSSIAN_2ND_DER= (1/stddev).*(x^2/stddev - 1).*GAUSSIAN;
%gauss3der=
GABOR_SIN=GAUSSIAN.*sin(x);
GABOR_COS=GAUSSIAN.*cos(x);

done = 1;
