function short = trunc(datum,signfig)
% Takes a  number datum and returns a vertical vector of text string with data
% truncated to signfig significant figures
% Unfinished, gives ASCII codes now
% AB 4/28/97
% num2str(num,prec) does that

short = num2str(datum)
firstsignpos = min(find(short>'0'))
short(:,firstsignpos+signfig-1) = short(:,firstsignpos+signfig-1) + (short(:,firstsignpos+signfig) > '4')
short = short(:,1:firstsignpos+signfig-1);
