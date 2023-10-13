function finej=overlapaxis(finej,ejes)
% OVERLAPAXIS - Yields least extreme combination of current axis values and FINEJ
% AB Aug 01
% 
% See also EXTREMEAXIS

% ejes=maxej;

if ejes(1)>finej(1),
            finej(1)=ejes(1);
end
if ejes(2)<finej(2),
            finej(2)=ejes(2);
end
if ejes(3)>finej(3),
            finej(3)=ejes(3);
end
if ejes(4)<finej(4),
            finej(4)=ejes(4);
end
