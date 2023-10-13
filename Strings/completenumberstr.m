function numberstr=completenumberstr(number,digits)
% Returns a string ending in NUMBER with as many leading zeros as necessary to make the
% string DIGITS long
numberstr=num2str(number);
missingdigits=digits-floor(log10(number))-1;
for i=1:missingdigits,
    numberstr=['0',numberstr];
end
return;