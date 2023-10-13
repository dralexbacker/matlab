function shifted = shift(trace,desbaselineval,t)
% SHIFT
% AB Apr 00
% function shifted = shift(trace,desbaselineval,t)
% Shifts TRACE up or down so that most common value in trace(t) is DESBASELINEVAL
% DESired BASELINE VALue

vposbline = findpeak(trace(t),1);
shifted = trace+(desbaselineval-vposbline);
