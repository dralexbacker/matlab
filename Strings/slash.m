function slash=slash()
% SLASH - Provides the right slash for paths according to the OS
% function slash=slash()
% AB Jul 00

if computer=='LNX86',
	slash='/';   
elseif computer=='PCWIN',
   slash='\';
end
