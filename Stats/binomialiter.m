function [realpval] = binomialiter(p1,p2,N1,N2,precision,Niter)
% BINOMIALiter - Yields the p that two observations of a binomial distribution stem from the same underlying distribution by calculating the p that a difference equal or
% greater than that between p1 and p2 is observed if there is only one underlying probability
% Numerical or iterative version. See also BINOMIALANAL.
% AB Aug 01
% [realpval] = binomialiter(p1,p2,N1,N2,precision,Niter)
%
% p1 & p2 the two probabilities being compared to see if they can come from the same underlying distribution
%   They represent the two 'conditions'.
% N1 & N2 are the # of experiments for p1 & p2, respectively. Default N2=N1.
% pvalue represents the probability that the null hypothesis, namely that both conditions are equal, is true
% Niter is # of trials to do to calculate pvalues, the greater the better
%
% Takes p(underlying prob==X | p1 & p2) = p(p1 & p2 | underlying prob==X)
%
% Binomialsimpleconservative is a simplification taking the most probable scenario, namely that the underlying p is halfway between p1 & p2, 
% and thus yields higher pvalues.
% Binomial extremes was written for testing purposes only and uses the prob that an observation is equal or greater in magnitude from the actual observation given 
% a given underlying probability as an estimate for the probability of that underlying prob given the observations. Binomialdiffn & Binomial, in contrast, uses the probability of the observation
% being closer to the actual observation given a PRECISION.
% Binomial requires N1=N2.

if nargin<4,
    N2=N1;
end
if nargin<5,
    precision=.1;
end
if nargin<6,
    Niter=1000;
end

if p1>p2, % Make p1 the smallest
    [p1,p2]=swap(p1,p2);
    [N1,N2]=swap(N1,N2);
end
dobs=p2-p1; % prob difference observed

k=0;
for m=0:precision:1,
    k=k+1;
    p12=m; % p of getting a head:
    
    for i=1:Niter,
        n1=0; n2=0;
        for j1=1:N1,
            n1=n1+(rand(1,1)<p12); % # of heads
        end
        pr1(i)=n1/N1; % proportion heads this trial
        if 0, %N1==N2,
            pr2(i)=pr1(i);
        else,
            for j2=1:N2,
                n2=n2+(rand(1,1)<p12); % # of heads
            end
            pr2(i)=n2/N2; % proportion heads this trial
        end
    end
    
    % Prob of underlying success prob being p12 given p1 & p2 observed:
    pp1=length(find(abs(pr1-p1)<precision))/Niter; % This precision and the precision in line 40 could in principle be different
    pp2=length(find(abs(pr2-p2)<precision))/Niter;
    pp(k)=pp1*pp2;
    
    % Prob of getting a larger difference of p's than observed given underlying success prob is p12:
    pvalue(k)=length  (find(  abs(pr1-pr2)>=dobs  )  )  /Niter;
    
end
totp=sum(pp);
realpval=sum(pp.*pvalue)/totp;

