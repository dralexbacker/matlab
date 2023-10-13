function [cout, hand] = contour(varargin)
%CONTOUR Contour plot.
%   CONTOUR(Z) is a contour plot of matrix Z treating the values in Z
%   as heights above a plane.  A contour plot are the level curves
%   of Z for some values V.  The values V are chosen automatically.
%   CONTOUR(X,Y,Z) X and Y specify the (x,y) coordinates of the
%   surface as for SURF.
%   CONTOUR(Z,N) and CONTOUR(X,Y,Z,N) draw N contour lines, 
%   overriding the automatic value.
%   CONTOUR(Z,V) and CONTOUR(X,Y,Z,V) draw LENGTH(V) contour lines 
%   at the values specified in vector V.  Use CONTOUR(Z,[v v]) or
%   CONTOUR(X,Y,Z,[v v]) to compute a single contour at the level v. 
%   [C,H] = CONTOUR(...) returns contour matrix C as described in
%   CONTOURC and a column vector H of handles to LINE or PATCH
%   objects, one handle per line.  Both of these can be used as
%   input to CLABEL. The UserData property of each object contains the
%   height value for each contour. 
%
%   The contours are normally colored based on the current colormap
%   and are drawn as PATCH objects. You can override this behavior
%   with the syntax CONTOUR(...,'LINESPEC') to draw the contours as
%   LINE objects with the color and linetype specified.
%
%   Uses code by R. Pawlowicz to handle parametric surfaces and
%   inline contour labels.
%
%   Example:
%      [c,h] = contour(peaks); clabel(c,h), colorbar
%
%   See also CONTOUR3, CONTOURF, CLABEL, COLORBAR.

%   Additional details:
%
%   CONTOUR uses CONTOUR3 to do most of the contouring.  Unless
%   a linestyle is specified, CONTOUR will draw PATCH objects
%   with edge color taken from the current colormap.  When a linestyle
%   is specified, LINE objects are drawn. To produce the same results
%   as MATLAB 4.2c, use CONTOUR(...,'-').
%
%   Thanks to R. Pawlowicz (IOS) rich@ios.bc.ca for 'contours.m' and 
%   'clabel.m/inline_labels' so that contour now works with parametric
%   surfaces and inline contour labels.

%   Copyright 1984-2001 The MathWorks, Inc. 
%   $Revision: 5.17 $  $Date: 2001/04/15 12:03:50 $

error(nargchk(1,5,nargin));

nin = nargin;
if isstr(varargin{end})
    nin = nin - 1;
end

if nin <= 2,
    [mc,nc] = size(varargin{1});
    lims = [1 nc 1 mc];
else
    lims = [min(varargin{1}(:)),max(varargin{1}(:)), ...
            min(varargin{2}(:)),max(varargin{2}(:))];
end

[c,h,msg] = contour3(varargin{:});
if ~isempty(msg), error(msg); end

for i = 1:length(h)
  set(h(i),'Zdata',[]);
end

if ~ishold
  view(2);
  set(gca,'box','on');
  grid off
end

if nargout > 0
    cout = c;
    hand = h;
end
