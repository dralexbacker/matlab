function done = barebg(m,eb,cm,ceb)
% BAREBG - Grouped Bar Graph w/error bars
% function done = barebg(m,eb,cm,ceb)
% m = mean measurement
% eb = error bar magnitude (>=0)
% cm = 1-letter string to denote color of main bar
% ceb = 1-letter string to denote color of error bar
% if m and eb are matrices, each line is taken as a group 
% AB May 1, 99

if ~exist('cm'),
   cm = 'k';
end
if ~exist('ceb'),
   ceb = 'g';
end

hold off
ebh = m+sign(m).*eb; % error bar height
bar([1:length(m)],ebh,0.1,'grouped')
hold on
bar([1:length(m)],m,'grouped')

done = 1;