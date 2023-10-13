function bar = times2bar(timeson,timesoff,barlen)

% function bar = times2bar(timeson,timesoff)
% Yields a vector of length BARLEN that is 1 between consecutive TIMESON 
%   and TIMESOFF and 0 elsewhere
% AB Feb 99
% Yields zero vector of length BARLEN if TIMESON is empty

%if ~(size(timeson)==size(timesoff)),
%  error('TIMESON and TIMESOFF must be the same size')
%end
if min(size(timeson))>1,
  error('TIMESON must be a vector, not a matrix')
end
if min(size(timesoff))>1,
  error('TIMESOFF must be a vector, not a matrix')
end
  
bar = zeros(1,barlen);
if ~isempty(timeson),
 for i = 1:min(length(timeson),length(timesoff)),
  bar(timeson(i):timesoff(i))=1;
 end
 bar = bar(1:barlen);
 if length(timeson)>length(timesoff),
   bar(timeson(end):end)=1; % If it ended on, make last pulse show as on too
 end
end
