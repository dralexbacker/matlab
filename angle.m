function p = angle(h)
%ANGLE  Phase angle.
%   ANGLE(H) returns the phase angles, in radians, of a matrix with
%   complex elements.  
%
%   Each element of the input should be in the form: x+iy. e.g. pi/2=angle(0+i)
%
%   See also ABS, UNWRAP.

%   Copyright 1984-2000 The MathWorks, Inc. 
%   $Revision: 5.5 $  $Date: 2000/06/01 00:40:14 $

% Clever way:
% p = imag(log(h));

% Way we'll do it:
p = atan2(imag(h), real(h));
