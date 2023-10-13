function dum = mv2dirs(targetdir)
% Moves all files in current directory corresponding to one experiment, 
% identified by one date, to a directory which it creates for that purpose
% AB May 98

if ~exist(targetdir),
  targetdir = '';
end

d = dir(pwd);
nf = size(d,1);
done = zeros(1,nf);% 1 for transferred files, 
  % better than redoing dir xq you don't go thru other nondate files again
for f = 1:nf,
  if ~done(f),
   fecha = finddate(d(f).name);
   if fecha ~= 0,
    if ~isempty(targetdir),
      status = mkdir(targetdir,fecha);
    else,
      status = mkdir(fecha);
    end
%    copyfile(d(f).name,[targetdir,fecha,'/',d(f).name]);
%    delete(d(f).name);
    source = d(f).name;
    dest = [targetdir,fecha,'/'];
    eval(['!mv ',source,' ',dest])
    done(f) = 1;
    for g = f+1:nf,
      if strcmp(finddate(d(g).name),fecha),
%        copyfile(d(g).name,[targetdir,fecha,'/',d(g).name]);
%        delete(d(g).name);
	    source = d(g).name;
   	 dest = [targetdir,fecha,'/'];
    	 eval(['!mv ',source,' ',dest])
       done(g) = 1 ;
      end
    end
   end  % if fecha
  end
end
dum = 1;

