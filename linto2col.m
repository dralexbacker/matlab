function conv =linto2col(num,total)
%
% Yields number to be used for subplot number if there are TOTAL subplots and 2 columns and you leave the bottom two plots blank
% AB Dec 99

h = ceil(total/2);
if num>h,
   conv = (num-h)*2;
%   conv = h+conv;
else,
   conv = num*2 - 1;
end
