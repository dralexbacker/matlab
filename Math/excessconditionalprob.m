function [excesspagivenb,excesspbgivena]=excessconditionalprob(ab,a,b,t)

% Cytometry correction does not apply because it's not two independent
% conditions: expected <ab> is *assuming independence of a and b*, and
% thus, the # of documents that have both words used by association (as
% opposed to by chance)

if nargin<4,
    t=3307998701 ; % # of pages indexed, updated 12/14/03
end

pab=ab/t;
pa=a/t;
pb=b/t;

pagivenb=pab/pb;
exppagivenb=pa; % pa.pb/pb;
excesspagivenb=pagivenb-exppagivenb;

pbgivena=pab/pa;
exppbgivena=pb; 
excesspbgivena=pbgivena-exppbgivena;

