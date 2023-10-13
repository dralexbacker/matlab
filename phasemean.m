function meanphase=phasemean(p)
% PHASEMEAN - Computes the vector average of x
% mn=phasemean(x)
% AB Aug 00
%
% mn returns a phase between -pi and pi
% 
% p is a vector of phases (anywhere in (-Inf Inf)

p=reshape(p,1,prod(size(p)));

% h=1 hypothenuse, norm of phases 1 by my convention:
x=cos(p); %*1; % adjacent, x
y=sin(p); %*1; % opposite, y

cplex=[x;y]';
mn=vectoravg(cplex);
x=mn(1);
y=mn(2);

% Now go back from complex x,y to phase:
meanphase=angle(x+i*y);
%meanphase=xy2phase(mn); %atan(y/x);