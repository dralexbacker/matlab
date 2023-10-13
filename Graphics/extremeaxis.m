function finej=extremeaxis(finej)
% EXTREMEAXIS - Yields most extreme combination of current axis values and FINEJ
% AB May 01

ejes=axis;
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
