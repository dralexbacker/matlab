function maximize(fignv)
% MAXIMIZE - Maximizes figure(s) whose figure # is provided in FIGNV is provided (default current figure)
% AB Mar 02

% Size set for Tintin with double-width Start bar
 
if nargin<1,
    fignv=gcf;
end
fignv=fignv(:);
for i=fignv',
    figure(i)
    set(i,'Position',[1 54 1024 647])
end
    
