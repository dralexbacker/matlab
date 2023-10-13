function drive=currdrive
% Yields current disc drive
% eg. 'h:'
% AB Mar 02

drive=pwd;
drive=drive(1:2);
