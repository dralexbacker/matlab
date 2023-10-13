function groupmembership=group(vector,Ngroups)
% GROUP - Converts a vector into a set of Ngroups groups grouped by magnitude in ascending order
% AB Mar 02
%
% GROUPMEMBERSHIP is a vector of size(VECTOR) with labels 1:Ngroups
%
% Useful to convert groups from continuous to discrete classes for ANOVAN

if any(size(vector))>1,
    error('GROUP takes vector inputs')
end

lv=length(vector);
[s,i]=sort(vector);

minNpergroup=floor(lv/Ngroups);
resto=rem(lv,Ngroups);
Npergroup(1:resto)=minNpergroup+1;
Npergroup(resto+1:Ngroups)=minNpergroup;

lastprev=0;
for g=1:Ngroups,
    classstart(g)=lastprev+1;
    classend(g)=classstart(g)+Npergroup(g)-1;
    groupmembership(i(classstart(g):classend(g)))=g;
    lastprev=classend(g);
end
