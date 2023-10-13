function plotatintervals(v,interval,lag,string)
% PLOTATINTERVALS
% Plot V at intervals INTERVAL starting at lag LAG, with PLOT parameter STRING
% AB Jan 02
%
% plotatintervals(v,interval,lag,string)

if nargin<3 | isempty(lag),
    lag=0;
end
if nargin<4,
    string='';
end

lv=length(v);
plot(lag+1:interval:lv,v(lag+1:interval:lv),string)
