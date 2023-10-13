function shuffled = shuffle(seltr)
% function shuffled = shuffle(vector)
% Yields shuffled version of vector
% AB Jan 99

shuffled = seltr(randperm(length(seltr)));