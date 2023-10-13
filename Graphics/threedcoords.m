function threedcoords=threedcoords(ndimcoords,vertex3dcoords)
% AB Oct 01
% vertex3dcoords{i}=1x3 vector

n=length(ndcoords);
maxi=max(ndcoords);
scale=maxi; % Will be used for color coding of intensity of response
normndcoords=ndcoords./maxi;

for dim=1:n-1,
    threedcoords=midpoint(vertex3dcoords{dim},vertex3dcoords{dim+1});


