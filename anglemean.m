function mn=anglemean(angles)
% Uses PHASEMEAN.
% ANGLEMEAN - Returns mean of an angle calculated as a complex number
% AB Mar 02

%     o=sin(angles); %/h;
%     a=cos(angles); %/h;
%     v=vectoravg([a(:) o(:)]);
%     % tan=o/a
%     mn=atan(v(2)/v(1));
% This is wrong because it works only in the first quadrant.

    mn=phasemean(angles);