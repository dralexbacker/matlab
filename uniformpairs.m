function stim=uniformpairs(stim);
% UNIFORMPAIRS - Changes STIM matrix so that odor pairs are reported with 
% AB Jul 00
%
% Use before selectnaive and before sorting stim.mat, but after conc.m (STIM should have real concs, not code)

lines=find(stim(:,3)~=2 & stim(:,1)>stim(:,3));
stim(lines,2)=1-stim(lines,2); % conc inversion
[stim(lines,1),stim(lines,3)]=swap(stim(lines,1),stim(lines,3));