function conv =linto2col(num,total)
%
% Yields number to be used for subplot number if there are TOTAL subplots and 2 columns

h = ceil(total/2);
if rem(total,2),
  a = total;
else,
  a = total-1;
end
m = [[1:2:a]',[2:2:a+1]'];
if num<h,
  conv = m(num,1);
else,
  conv = m(num+1-h,2);
end

conv = num*2 - 1;
if num>h,
   conv = h+conv;
end
