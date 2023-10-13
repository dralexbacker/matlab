function diffang = phaseinterv(ph1,ph2)
% function diffang = phaseinterv(ph1,ph2)
% AB Apr 2000, debugged Mar 2002
% Yields the phase difference PH(2)-PH(1) in radians 
% Takes scalars or vectors, not matrices

% Copyright (c) 2002 Alex Backer 

if min(size(ph1))>1 | min(size(ph2))>1,
    error('PHASEINTERV takes scalars or vectors, not matrices')
end
[ph1,ph2]=matrifyscalar(ph1,ph2);
if ~isequal(size(ph1),size(ph2)),
    error('PHASEINTERV requires inputs of equal size')
end

if max(size(ph1))>1,
    dime=2;
else,
    dime=1;
end
    
u=unwrap([ph1(:) ph2(:)],[],dime);
diffang=diff(u');
% Wrong way: diffang = phasenormalize(ph2-ph1); (see phaseinterv(-8*pi/9,pi))
