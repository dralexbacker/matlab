function finej=extremeaxisdata(finej,data)
% EXTREMEAXISdata - Yields most extreme combination of current plot values and FINEJ
% AB Oct 01

ejes(1)=0;
ejes(2)=length(data);
ejes(3)=min(data);
ejes(4)=max(data);

if ejes(1)<finej(1),
            finej(1)=ejes(1);
end
if ejes(2)>finej(2),
            finej(2)=ejes(2);
end
if ejes(3)<finej(3),
            finej(3)=ejes(3);
end
if ejes(4)>finej(4),
            finej(4)=ejes(4);
end
