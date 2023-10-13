function [classstart,classend] = numerate(numinclass)
% function [classstart,classend] = numerate(numinclass)
% Orders elements in length(NUMINCLASS) classes, the number in each of which is given by NUMINCLASS, in one list
% and yields the starting & ending number of each class in CLASSSTART & CLASSEND.

if min(size(numinclass))~=1,
   error('NUMINCLASS must be a vector')
end

last = 0;
for class = 1:length(numinclass),
   classstart(class) = last+1;
   classend(class) = classstart(class)+numinclass(class)-1;
   last = classend(class);
end
