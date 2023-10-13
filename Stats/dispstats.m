function [avg,stdev,mini,maxi] = dispstats(variable);

% function [avg,stdev,min,max] = dispstats(variable);
% Returns a vector with avg, stdev, min and max of variable
% AB Mar 98

avg = mean(variable);
stdev = std(variable);
mini = min(variable);
maxi = max(variable);

