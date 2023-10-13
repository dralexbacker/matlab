function morph(filename1,filename2,sec)

if nargin<1,
    filename1='\\131.215.31.186\my documents\My Pictures\Fotos\2003\Pablo 10 dias 001.jpg';
    filename2='\\131.215.31.186\my documents\My Pictures\Fotos\2000\10 semanas\consleepingbeautycloseup.jpg';
    filename2='\\131.215.31.186\my documents\My Pictures\Fotos\2000\10 semanas\lovoyapensar.jpg';
    sec=4; % seconds for the transition
end

framespersec=1;

a=imread(filename1);
b=imread(filename2);
size(a)
size(b)
mindims=min([size(a);size(b)]);
a=double(a(1:mindims(1),1:mindims(2),1:mindims(3))); % cut out the bottom right if too large
b=double(b(1:mindims(1),1:mindims(2),1:mindims(3))); % cut out the bottom right if too large

im(:,:,:,1)=a;
imshow(a)
Nframes=sec*framespersec;
direction=b-a;
for frame=1:Nframes,
    im(:,:,:,frame+1)=a+direction./Nframes;
    imshow(im(:,:,:,frame+1))
end
%mov = immovie(im); %,map);
%movie(mov);

% aid = aopen;
% aid = avilib;
% aid = awrite(aid,image1[,image2,...,imageN])
% aid = aclose(aid)
