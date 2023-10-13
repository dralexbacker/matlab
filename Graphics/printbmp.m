function printbmp(figs,dire)
% PRINTBMP - Print FIGS as BMP in DIRE 
% printbmp(figs,dire)
% AB Jun 01

%cd(sumdir)
%mkdir(dire)
cd(dire)
for i=figs,
    figure(i)
    name=['fig',num2str(i)];
    print -dbmp name
end


