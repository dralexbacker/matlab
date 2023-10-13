% plotfirma.m
pause(5)
bname = 'firmaAB';
%cd('d:\My documents\Cine')
cd('d:\Alex\Matlab\General')
excl=[125:145];

for j = 1%1:13,
   name = [bname]; %,num2str(j)];
fid = fopen(name,'r');
len = fscanf(fid,'%d\n',[1,1]);
sig = fscanf(fid,'%f %f\n',[2,len]);
fclose(fid);
      
GRADUAL = 1;      
step = 1;
lw=2;
col=[0 0 0];
if GRADUAL,
   figure(j);clf;hold on; set(gca,'Color',[1 1 1])
   x = sig(1,:); y = -sig(2,:)+max(sig(2,:));
      axis([min(x)-5 max(x)+5 min(y)-5 max(y)+5])
      set(gca,'xtick',[],'ytick',[]);
     x = sig(1,1:1+step); y = -sig(2,1:1+step)+max(sig(2,:));
     hs = plot(x,y,'linewidth',2,'color',[0 0 0]); 	   
   for i = 1:step:len-step,   
%      i
 %     if isempty(findstr(i,excl)),
     x = sig(1,1:i+step); y = -sig(2,1:i+step)+max(sig(2,:));
     set(hs,'XData',x,'YData',y,'Erasemode','none','linewidth',2,'color',[0 0 0]);
     pause(0)
     t0 = clock;
     while etime(clock,t0)<.05,
     end
  %   end % if ~findstr0
   end
else,   % All at once
      x = sig(1,:); y = -sig(2,:)+max(sig(2,:));
      figure(j);clf
      hs = plot(x,y); set(hs,'linewidth',2);
      axis([min(x)-5 max(x)+5 min(y)-5 max(y)+5])
      set(gca,'xtick',[],'ytick',[]);
end
end % for j