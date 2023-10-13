function binario=decodephotosignature(imagen,x,y,colorN)

if nargin<4,
    colorN=1;
end
if size(x)~=size(y),
    error('X and Y must be same size')
end

% maxx=size(imagen,1);
% maxy=size(imagen,2);
% x=ceil(x*maxx);
% y=ceil(y*maxy);

binario=zeros(size(x));
for i=1:length(x),
    binario(i)=imagen(x(i),y(i),colorN)>imagen(x(i)-1,y(i),colorN);
end
