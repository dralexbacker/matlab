function fecha = finddate(string)
% Returns date in string, as d(d)mmm(m)yy, where d is day (1-2 digits), m is 
% month (3-4 non-capital letters), and y is year (last 2 digits)
% AB May 98

len = length(string);
if len>5,
for l = 1:len-2,
  switch string(l:l+2)
     case {'jan','feb','mar','apr','may','aug','sep','oct','nov','dec'},
        if string(l+3:l+4)>='00' & string(l+3:l+4)<='99',
           if l-2>0 & string(l-2)>='0' & string(l-2)<='9',
              start = l-2;
              fin = l+4;
              break;
           else,
	      start = l-1;
              fin = l+4;
              break;
           end
        end
     case {'jun','jul'},
        if string(l+4:l+5)>='00' & string(l+4:l+5)<='99',
           if l-2>0 & string(l-2)>='0' & string(l-2)<='9',
              start = l-2;
              fin = l+5;
              break;
           else,
	      start = l-1;
              fin = l+5;
              break;
           end
        end
   end
end
end

if exist('start'),
  fecha = string(start:fin);
else,
  fecha = 0;
end

	   % Ad-hoc clause for beta kate:
%if fecha == '3mar97' or fecha == '16apr97',
%  fecha = 0;
%end
