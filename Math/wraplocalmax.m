function wlmi = wraplocalmax(vector)
% WRAPLOCALMAX - Version of LOCALMAX that takes VECTOR as wrapping around the ends so as to detect peaks at 1st and last elements
% wlmi = wraplocalmax(vector)
% Yields indices where vector has zero derivative and negative 2nd derivative
% AB Jul 00
%
% See LOCALMIN, PEAKFIND

lv=length(vector);
vector = detrend(vector,0);
hlk = 2; % how many elements to wrap around
vector = [vector(:,end-hlk+1:end)';vector';vector(1:hlk)']'; % wrap-around vector

d = diff(vector);

% To detect maxima that occupy adjacent bins with equal values
%vector = vector(1:end)&d; % converts values equal to their predecessor to 0
% make the repeated values into the midpoint b/w surrounding points
%d0i = find(d==0);
%vector(d0i+1)=0;
%squashedv = sparse(vector);

%j = 1;
%while (d0i+j)==0,
 % j = j+1;
%end
%vector([d0i]) = (vector([d0i]-1)+vector([d0i])+1)/2;


d2 = diff(d);
% Shift to account for d2 shorter than vector:
d2(2:end+1) = d2; 
d2(1) = 0;
d2(end+1) = 0;

zxr = zeros(size(d2));
zxr([zxings(d)]) = 1; % zxings will asign a zero-xing to the subindex *after* the crossing, which balances with diff's reduction of subindices by 1

lmi = find(zxr & d2<0); % local maxima indices
lmi=lmi-hlk;
wlmi=lmi(find(lmi>0 & lmi<=lv));