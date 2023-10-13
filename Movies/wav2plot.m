function wav2plot(fname,windowlen,step)

if nargin<2,
    windowlen=8000;
end
if nargin<3,
    step=500;
end
comp=10;

cd 'c:\I386'
wavname=[fname,'.wav'];
[y,fs]=wavread(wavname);
sound(y,fs)

%y=decimate(y,comp);

% M(1) = im2frame(X1,map);
%       M(2) = im2frame(X2,map);
%        ...
%       M(n) = im2frame(Xn,map);

fin=length(y);  
count=0;
for i=1:step:fin-windowlen,
    count=count+1;
    plot(y(i:i+windowlen-1))
    M(count)=getframe;
end
movie(M)
aviname=[fname,'.avi'];
Nsteps=(fin-windowlen)/step;
framespersec=round(fs*Nsteps/fin);
movie2avi(M,aviname,'fps',framespersec)
