function printbw(fig)
% PRINTBW      - Prints figure FIG (by default current figure) in black & white
% function done = printbw(fig)
% AB June 00
%
% See also PRINTC

if exist('fig','var') & ~isempty(fig),
   pfig = gcf;
   fig=reshape(fig,1,length(fig));
else,
   fig=gcf;
end

for i=fig,
     figure(i)
	if computer=='LNX86',
   	 print -Poptra -dps
	elseif computer=='PCWIN',
   	print -dwin 
%   'Using Phaser until LaserJet fixed'
	end
end

if exist('pfig','var') & ~isempty(fig),
  figure(pfig)
end
