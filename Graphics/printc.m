function printc(fig)
% PRINTC      - Prints figure FIG (by default current figure) in color
% function done = printc(fig)
% AB Apr 00
%
% See also PRINTBW

if exist('fig','var') & ~isempty(fig),
  pfig = gcf;
  figure(fig)
end

if computer=='LNX86',
    print -Pcolor -dpsc
elseif computer=='PCWIN',
    print -dwinc
end

if exist('fig','var') & ~isempty(fig),
  figure(pfig)
end
