% Elimduplicatecellunits
% AB Feb 01

%cd('d:\My Documents\Gsc\')
cd('C:\Documents and Settings\alex\My Documents\GSC') 
addresses = textread('grademaillist.txt','%s');
mailed=textread('alreadymailed.txt','%s');
size(addresses)
size(mailed)
missing = setdiff(addresses,mailed);

%addmat=cell2str(addresses);
%maimat=cell2str(mailed);

FILENAME='missing.txt';
PERMISSION='w';
FID = fopen(FILENAME,PERMISSION);
for i=1:length(missing),
	fprintf(FID,missing{i},'s');
	%fprintf(FID,',','s');
    fprintf(FID,'\n');
end
fclose(FID)	   ;

