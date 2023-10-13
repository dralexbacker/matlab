function [modo,cuenta,uniq]=exactmode(vector)
% EXACTMODE - Yields most frequent element in VECTOR
% function [modo,cuenta,uniq]=exactmode(vector)
% AB Jul 00
%
% CUENTA yields the # of times each element of vector appears, in the order they are listed in UNIQ
%
% See also MODE, which yields the value of vector for which hist(vector,numbins) yields the greatest frequency
% See also UNIQUIFY

uniq=uniquify(vector);
cuenta=zeros(size(uniq));
for i=1:length(vector),
   cual=find(uniq==vector(i));
   cuenta(cual)=cuenta(cual)+1;
end
modo=uniq(find(cuenta==max(cuenta)));
modo=modo(1);