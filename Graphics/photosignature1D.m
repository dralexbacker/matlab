function imagen=photosignature1D(imagen,Nbits,binario,colorN)
% x,y vectors with numbers 0 to 1 each
% binario binary vector with code

% Note that you could also encode it in the parity of the difference
% between arbitrary pairs of pixels/bits and all you'd ever have to do is
% change a pixel by 1 bit

%function imagen=photosignature(imagen,x,y,binario,colorN)

% images are 3-D and ea pixel's color value goes from 0 to 255

if nargin<4,
    colorN=1;
end
maxcolor=255;

% maxx=size(imagen,1);
% maxy=size(imagen,2);
% x=ceil(x*maxx);
% y=ceil(y*maxy);

x=2:2:Nbits+1;

% Uniquify x,y pairs
%[sx,in]=sort(x);
% Exclude any x=1

h=timebar(0);
lx=length(x);
for i=1:lx,
    timebar(i/lx,h);
    a=imagen(x(i)); b=imagen(x(i)-1);
    if (a>b)~=binario(i),
        if a==b,
            if binario(i),
                if b<maxcolor,
                    imagen(x(i))=b+1;
                else,
                    imagen(x(i)-1)=a-1;
                end
            else,
                if b<maxcolor,
                    imagen(x(i)-1)=b+1;
                else,
                    imagen(x(i))=a-1;
                end
            end
        else,
            imagen(x(i)-1)=a;imagen(x(i))=b;
        end
    end
end
close(h)
%toswap=find(imagen(x,y,colorN)<imagen(x-1,y,colorN)); % vector
%[imagen(x(toswap)-1,y(toswap),colorN),imagen(x(toswap),y(toswap),colorN)]=swap(imagen(x(toswap),y(toswap),colorN),imagen(x(toswap)-1,y(toswap),colorN));
