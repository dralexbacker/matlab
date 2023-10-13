% Removes a series of files
% Written to remove series of files with digits at the end of the names
% AB Mar 99

sourcedir = '/home1/abacker/locust/alexdata/020499c1/noamp/'
sourcename = 'ab020499c1t'
sourcet = [88:103];

count = -1;
for i = sourcet,
  xa = i;  
  if xa<10,
       z='00';
       elseif xa<100,
       z='0';
       else
       z='';
    end;
  suffix=[z int2str(xa)];	
  source = [sourcedir,sourcename,suffix,'.txt'];
  count = count+1;
% CAREFUL: REMOVES FILES:  
  eval(['!rm ', source])
end
