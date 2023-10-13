function [numseries,start,stop] = numseries(vector,num)
% NUMSERIES - Returns the number (NUMSERIES), START and STOP indices of nonconsecutive 'series' of number NUM appear in VECTOR
% function [numseries,start,stop] = numseries(vector,num)
% AB Dec 01

if size(num)~=[1 1],
    error('NUMSERIES error: NUM must be a scalar')
end
if min(size(vector))>1,
    error('NUMSERIES error: VECTOR must be a vector')
end

ind=find(vector==num);
if isempty(ind),
    numseries=0;
    start=0;
    stop=0;
else,
    d=diff(ind);
    chg=find(d>1);
    numseries=length(chg)+1;
    start(1)=ind(1);
    start(2:numseries)=ind(chg+1);
    stop(1:numseries-1)=ind(chg); %start(2:end)-1);
    stop(numseries)=ind(end);
end
