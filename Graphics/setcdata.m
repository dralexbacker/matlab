function setcdata(cm,data,clim,h)
% SETCDATA - Sets CData for object of handle H so that it uses the *whole* colormap CM
% function setcdata(cm,data,clim,h)
% Alex Backer Aug 00, alex@caltech.edu
%
% CM is the colormap to be used
% DATA is the data to color
% CLIM are the color axis limits, i.e. the data values to assign to the edges of the colormap
% H is handle to object. Default is GCO.
%
% Make sure data has the size/shape of the object whose colordata is to be set

if ~exist('h','var') | isempty(h),
   h=gco;
end

nlin=size(cm,1);
saturdat=max(min(data,clim(2)),clim(1));
nsaturdat=(saturdat-min(saturdat(:)))/max(saturdat(:)-min(saturdat(:))); % b/w 0 & 1
rescaleddat=1+round(nsaturdat*(nlin-1)); % colormap line #'s
C=cm(rescaleddat,:); % True color specification. =size(data)x3. Putting a matrix as subindex makes it vector.
C=reshape(C,[size(data),3]);
set(h,'CData',C);
   
      