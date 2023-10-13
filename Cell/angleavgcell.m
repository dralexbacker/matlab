function mn=angleavgcell(cel)
% angleAVGCELL - Yields vector average for each element of CEL
% AB Mar 02

for i=1:length(cel);
%     o=sin(cel{i}); %/h;
%     a=cos(cel{i}); %/h;
%     v=vectoravg([a(:) o(:)]);
%     % tan=o/a
%     mn(i)=atan(v(2)/v(1));
%    mn(i)=anglemean(cel{i});
    mn(i)=phasemean(cel{i});
end

