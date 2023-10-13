function [name,ext] = extension(fname)
% EXTENSION - Yields the prefix and extension of a filename or returns empty if none
% function [name,ext] = extension(fname)
% AB Jul 00
%
% e.g. ['extension','m']=extension('extension.m')

pp = (findstr('.',fname)); % period position
if ~isempty(pp) & pp>=length(fname)-3,
   ext=fname(pp+1:end);
   name=fname(1:pp-1);
else,
   ext=[];
   name=fname;
end
