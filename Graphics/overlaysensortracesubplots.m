function overlaysensortrace()

s1=52:61;
s2=62:71;
s3=72:81;

ca
cd tape28
for i=[s1,s2,s3],
    dat{i}=loaddat(i,'tape28',3,1);
end

figure
subplot(3,1,1)
hold on
for i=s1,
    plot(dat{i},'k')
end
for i=s2,
    plot(dat{i},'r')
end
ejes=axis;
ejes(3)=-10;
axis(ejes);
%xlabel('Time (sec)','Fontsize',20)
%ylabel('Sensor reading (Volts)','Fontsize',20)
%title('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)

%figure
subplot(3,1,2)
hold on
for i=s3,
    plot(dat{i},'k')
end
for i=s2,
    plot(dat{i},'r')
end
ejes=axis;
ejes(3)=-10;
axis(ejes);
%xlabel('Time (sec)','Fontsize',20)
%ylabel('Sensor reading (Volts)','Fontsize',20)
%title('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)

%figure
subplot(3,1,3)
hold on
for i=s1,
    plot(dat{i},'k')
end
for i=s3,
    plot(dat{i},'k')
end
ejes=axis;
ejes(3)=-10;
axis(ejes);
subxlabel('Time (sec)','Fontsize',20)
subylabel('Sensor reading (Volts)','Fontsize',20)
subtitle('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)

