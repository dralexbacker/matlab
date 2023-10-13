function imagen=photosignature(imagen,Nbits,binario,colorN)
% x,y vectors with numbers 0 to 1 each
% binario binary vector with code

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

x=2:Nbits+1;
y=x;

% Uniquify x,y pairs
%[sx,in]=sort(x);
% Exclude any x=1

for i=1:length(x),
    a=imagen(x(i),y(i),colorN); b=imagen(x(i)-1,y(i),colorN);
    if (a>b)~=binario(i),
        if a==b,
            if binario(i),
                if b<maxcolor,
                    imagen(x(i),y(i),colorN)=b+1;
                else,
                    imagen(x(i)-1,y(i),colorN)=a-1;
                end
            else,
                if b<maxcolor,
                    imagen(x(i)-1,y(i),colorN)=b+1;
                else,
                    imagen(x(i),y(i),colorN)=a-1;
                end
            end
        else,
            imagen(x(i)-1,y(i),colorN)=a;imagen(x(i),y(i),colorN)=b;
        end
    end
end
%toswap=find(imagen(x,y,colorN)<imagen(x-1,y,colorN)); % vector
%[imagen(x(toswap)-1,y(toswap),colorN),imagen(x(toswap),y(toswap),colorN)]=swap(imagen(x(toswap),y(toswap),colorN),imagen(x(toswap)-1,y(toswap),colorN));
