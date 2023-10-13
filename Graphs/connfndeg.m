function connfndeg(connmat)
% CONNFNDEG - Connectivity as a function of degree
% function connfndeg(connmat)
% AB Apr 03
% 
% CONNMAT = connectivity matrix

nofn=sum(conmat'>0); % # of fwd neighbors per node
nobn=sum(conmat>0); % # of backward neighbors per node



% Bin:
[counts,centers]=hist(nofn);

