function overlaysensortraces()

FIG_6_5=1; % Thesis ch.6 fig 5
FIG_8_2b=0;

if FIG_6_5,
    s1=52:61;
    s2=62:71;
    s3=72:81;
elseif FIG_8_2b,
    s1=138:141;
    s2=[];
    s3=148:151;
end

ca
cd tape28
for i=[s1,s2,s3],
    dat{i}=loaddat(i,'tape28',3,1);
end

figure
hold on
for i=s1,
    hk=plot(dat{i},'k');
end
for i=s2,
    hr=plot(dat{i},'r');
end
ejes=axis;
ejes(3)=-10;
axis(ejes);
xlabel('Time (sec)','Fontsize',20)
ylabel('Sensor reading (Volts)','Fontsize',20)
%title('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)
legend([hk;hr],{'0.18' '0.2'},4) %{'k' 'r'})

figure
hold on
for i=s3,
    hk=plot(dat{i},'k');
end
for i=s2,
    hr=plot(dat{i},'r');
end
ejes=axis;
ejes(3)=-10;
axis(ejes);
xlabel('Time (sec)','Fontsize',20)
ylabel('Sensor reading (Volts)','Fontsize',20)
%title('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)
legend([hk;hr],{'0.18' '0.2'},4) %{'k' 'r'})

figure
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
xlabel('Time (sec)','Fontsize',20)
ylabel('Sensor reading (Volts)','Fontsize',20)
%title('Time-course of odor pulse as measured by CO2 sensor','Fontsize',20)
set(gca,'XTick',[1000:1000:6000],'XTickLabel',[0:5],'Fontsize',20)

