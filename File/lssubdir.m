function dum = lssubdir()

% Lists directory of each date subdirectory in pwd
% AB June 98

pwd
d = dir;
for f = 1:size(d,1),
  if d(f).isdir & finddate(d(f).name),
   	cd(['/home/abacker/locust/katedata/',d(f).name]);
      d(f).name
      ls
      'Press any key to see next subdirectory listing'
      pause
  end
end
