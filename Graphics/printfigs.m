function printfigs(n,orientation)
% PRINTFIGS - Prints figures defined by N vector
% AB Aug 00

for i=n,
   figure(i)
   if exist('orientation','var') & isequal(orientation,'landscape'),
       orient landscape
   else
       orient tall
   end
   print -dwinc
end
