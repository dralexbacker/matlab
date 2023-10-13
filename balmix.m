function balmix = balmix(seq,subseq)
% function balmix = balmix(seq,subseq)
% seq is the sequence to be selected and shuffled
% subseq is the list of indices of which 2x & 2x+1 will be selected
% Balances even and odd indices of a sequence and shuffles it
% AB Jan 99

bal = [2.*seq([subseq]);2.*seq(subseq)+1]; % Females 1st, then Males
balmix = bal(randperm(length(bal))); % Males and females shuffled
