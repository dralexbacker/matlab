function done = bareb(m,eb,cm,ceb)
% function done = bareb(m,eb,cm,ceb)
% m = mean measurement
% eb = error bar magnitude (>=0)
% cm = 1-letter string to denote color of main bar
% ceb = 1-letter string to denote color of error bar
% AB May 1, 99

if ~exist('cm','var'),
   cm = 'k';
end
if ~exist('ceb','var'),
   ceb = 'g';
end

hold off
ebh = m+sign(m).*eb; % error bar height
bar([1:length(m)],m,cm)
hold on
bar([1:length(m)],ebh,0.1,ceb)
bar([1:length(m)],m-sign(m).*eb,0.1,cm)

done = 1;