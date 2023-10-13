function [year,month,day]=date2yrmoday(datestr)
% DATE2YRMODAY
% AB Nov 2006
% Converts a string like 2005-12-28 to year, month, day
% Requires year to be 4 digits, month and day 2 each

year=str2num(datestr(1:4));
month=str2num(datestr(6:7));
day=str2num(datestr(9:10));
