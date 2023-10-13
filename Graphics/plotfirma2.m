% plotfirma.m
bname = 'firmaAB';
%cd('d:\My documents\Cine')
cd('d:\Alex\Matlab\General')
for j = 1%1:13,
   name = [bname]; %,num2str(j)];
fid = fopen(name,'r');
len = fscanf(fid,'%d\n',[1,1]);
sig = fscanf(fid,'%f %f\n',[2,len]);
fclose(fid);
      
dontdraw = [166:186];
%sig(1,dontdraw) = sig(1,1);
%sig(2,dontdraw) = sig(2,1);

GRADUAL = 1;      
step = 1;
if GRADUAL,
      figure(j);clf;hold on;
      x = sig(1,:); y = -sig(2,:)+max(sig(2,:));
      axis([min(x)-5 max(x)+5 min(y)-5 max(y)+5])
      set(gca,'xtick',[],'ytick',[]);
     x = sig(1,1:1+step); y = -sig(2,1:1+step)+max(sig(2,:));
     hs = plot(x,y,'linewidth',2,'color',[0 0 0]); 	   
for i = 1:step:len-step,      
%     x = sig(1,1:i+step); y = -sig(2,1:i+step)+max(sig(2,:));
     if ~findstr(i,dontdraw), 
        x = [x,sig(1,i)];
        y = [y,-sig(2,i)];
     end
        set(hs,'XData',x,'YData',y,'Erasemode','none','linewidth',2,'color',[0 0 0]);
     %i
     pause(0)
     t0 = clock;
     while etime(clock,t0)<.0001,
     end
%     refresh
end
else,   % All at once
      x = sig(1,:); y = -sig(2,:)+max(sig(2,:));
      figure(j);clf
      hs = plot(x,y); set(hs,'linewidth',2);
      axis([min(x)-5 max(x)+5 min(y)-5 max(y)+5])
      set(gca,'xtick',[],'ytick',[]);
end
end % for j