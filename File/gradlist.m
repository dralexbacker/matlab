% grad list

cd('d:\My Documents\Gsc\')
addresses = textread('grademaillist.txt','%s');
size(addresses)
%dlmwriteab('commasepgrads.txt',addresses,','); % problem is writes commas as a binary piece of shit

FILENAME='commasep.txt';
PERMISSION='w';
FID = fopen(FILENAME,PERMISSION);
for i=1:length(addresses),
	fprintf(FID,addresses{i},'s');
	fprintf(FID,',','s');
end
fclose(FID)	   ;

%save 'commasep.txt' addresses -ascii
