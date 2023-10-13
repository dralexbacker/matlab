function varphase = phasevar(x)
% PHASEVAR - 2-dimensional variance, used, for e.g., for phases
% varphase = phasevar(x)
% AB Aug 00
%
% varphase belongs to [0 pi^2]
%
% If y is ommitted, x is a list of phases.
% If x & y are included, they are x and y-coords. of the vectors for which the variance is to be calculated
%
%	Vari needs to wrap around. Can calculate variance in 2-D, or mean phase difference from the mean phase: 
% var2D (Alex's def) = <(x-mean(x))^2> where x is the vector representation of phase and - is phase subtraction such that the result is 
% always in [-pi pi]. 
% Var2D has phase units, ranging from 0 to pi^2 (pi corresponding to case of two phases at polar opposites, mean phase zero).
%	Or don't use vari, use vector mean of phases / # of spikes, which gives 0 for a flat uniform (circular) phase distribution, 
% and 1 if all phases are identical. Vector mean of phases defined as vector sum of all vectors, one vector per spike, where ea. 
% Vector points in the direction of the corresponding spike's phase and has unit norm. I wonder if this scales linearly with var2D 
% (the mapping sure goes [0 1] --> [0 pi]. I prefer 2-D vari.

xmean=phasemean(x);
angledif=phasenormalize(x-xmean,-pi,pi); % -pi to pi is essential to get all distances to be less than pi in absolute value 
%                       i.e. to pick the smaller one between a distance and its complement (the other way around)
varphase=mean(angledif.^2);

% For the unbelievers, it actually works!:
% >> phasevar([pi -pi*9/10])
% 
% ans =
% 
%     0.0247
% 
% >> phasevar([pi pi*9/10])
% 
% ans =
% 
%     0.0247
% 
% >> x=-pi*9/10;
% >> xmean=pi;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.0987
% 
% >> xmean=-pi*8/10;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.0987
% 
% >> x=pi;
% >> xmean=-pi*9/10;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.0987
% 
% >> x=pi*.9;
% >> xmean=-pi*.9;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.3948
% 
% >> x=pi;
% >> xmean=-pi*.8;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.3948
% 
% >> x=0;
% >> xmean=pi*.2;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.3948
% 
% >> x=pi*.2;
% >> xmean=0;
% >> angledif=phasenormalize(x-xmean,-pi,pi);
% varphase=mean(angledif.^2)
% 
% varphase =
% 
%     0.3948