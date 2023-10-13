function [miny,maxy]=scaleformost(values,fractincl);
% SCALEFORMOST - Yields scale limits to use if FRACTINCL (default 95%) of VALUES elements should be included
% AB Jul 00
% [miny,maxy]=scaleformost(values,fractincl);

if ~exist('fractincl','var') | isempty(fractincl),
   fractincl = .95;
end
nsf= 2; % # of signif. figures

le=length(values);
s=sort(values);
nouteaside=ceil((1-fractincl)*le/2);
miny = sigfig(s(nouteaside+1),nsf);
maxy = sigfig(s(end-nouteaside),nsf);
