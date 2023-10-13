function p=pbinomial(rate,successes,samples)
% Yields the probability that a binomial distribution of RATE yields S or
% more successes out of N samples 
% function p=pbinomial(rate,successes,samples)

p=0;
for i=successes:samples,
    p=p+nchoosekab(samples,i,.001)*rate^i*(1-rate)^(samples-i);
    %p=p+comb(samples,i)*rate^i*(1-rate)^(samples-i);
end
%p=p/.0000000001;
