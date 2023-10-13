function [a,b]=matrifyscalar(a,b)
% MATRIFYSCALAR - If A or B is a scalar and the other is not, makes the scalar the same size as the other
% function [a,b]=matrifyscalar(a,b)

% Copyright (c) 2002 Alex Backer 


if size(a)==[1 1],
    a=a*ones(size(b));
elseif size(b)==[1 1],
    b=b*ones(size(a));
end



