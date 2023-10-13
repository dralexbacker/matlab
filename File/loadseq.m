function traindata = loadseq(numfiles,input_size)
% LOADSEQ
% AB May 97
%		Loads a sequence of files with names just differing
%		by a sequential number at the end

traindata = [];
for file = 1:numfiles,
  eval(['load left' file '.dat;'])
  eval(['load right' file '.dat;'])
  eval(['newdatal = [left' file '.dat;'])
  eval(['newdatar = [right' file '.dat;'])
  newdata = [newdatal(:,2:input_size/2+1),newdatar(:,2:input_size/2+1),newdatal(:,1)];
  traindata = [traindata;newdata];
end

save EyeInput traindata
