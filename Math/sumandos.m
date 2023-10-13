function sets = sumandos(p,q)

% Gives all the sets of q natural numbers that add up to p
% AB 2/98

index = 1;
for a = 1:p-(q-1),
   if q>1,
      resto = sumandos(p-a,q-1);
      numsets = size(resto,1);
   	setsize = size(resto,2);
   	sets(index:index+numsets-1,1) = a;
		sets(index:index+numsets-1,2:q) = resto;
	   index = index + numsets;
   else,
      sets = p;
   end
end

