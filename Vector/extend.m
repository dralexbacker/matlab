function v=extend(v,pos,interval)
% EXTEND    - Yields subset of vector V that extends POS all the way in
% both directions wit steps of INTERVAL
% AB Dec 2005

diag1a=v(pos:-1*interval:1);
diag1a=diag1a(end:-1:1);
diag1b=v(pos:interval:end);
v=[diag1a,diag1b];
