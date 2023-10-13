function buzz(sec)
% BUZZ
% Buzzes for SEC seconds. Default=1 sec
% AB Dec 2008

if nargin<1,
    sec=1;
end
soundsc(rand(1,sec*8192));