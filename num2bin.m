function binvector = num2bin(posinteger,dim)
% NUM2BIN
% AB May 97
%		Transforms an integer i into a vector of zeros except
%		for the i'th one, which is a 1

binvector = zeros(1,dim);
binvector(i) = 1;
