function pvalue = pvalue(numtests,numchoices,ncorrect,tail,fcorrect)
% PVALUE - Probability under the null hypothesis of a binomial distribution
% p = pvalue(numtests,numchoices,ncorrect,tail,fcorrect)
% Yields p-value of getting >=fcorrect proportion of numtests correct
% Assumes NUMCHOICES equiprobable choices
% Enter NCORRECT or FCORRECT
% If your hypothesis is that there can be a deviation from symmetry in only one direction, set tail=1.
% If you are testing for deviations from symmetry in any direction, set tail=2. Default=2.
% AB May 98. Modif. Jul 01
% If TAIL=1 and pvalue is significant, verify by hand that your hypothesis, rather than its opposite, was confirmed

% Requires COMB and FACT

if nargin<3,
   ncorrect = 0:numtests;
else,
    if isempty(ncorrect),
        fcorrect = max(fcorrect,1-fcorrect); % See explanation for fin below
    	ncorrect = ceil(fcorrect.*numtests);
    else,
        fcorrect=ncorrect/numtests;
        fcorrect = max(fcorrect,1-fcorrect); % See explanation for fin below
    	ncorrect = ceil(fcorrect.*numtests);
    end
end
if nargin<4,
    tail=2;
end
if tail~=1 & tail~=2,
    error('PVALUE: Tail must be 1 or 2')
end

pc=1/numchoices;
pw = 1-pc; % prob wrong (failure)

% Calcula todos indep. del fcorrect:        
count = 0;
for i = 0:numtests,	% numbercorrect
   count = count+1; % xq el cero se guarda en el subindice 1
   p(count) = (pc^i*pw^(numtests-i))*comb(numtests,i);
end


count = 0;
for i = ncorrect+1, % +1 xq el cero se guarda en el subindice 1
   count= count+1;
   fin=length(p);
    if tail==2,
        countv=uniquify([i:fin,1:fin-i+1]); % Si fin estuviera definido como extremo, principio o fin segun cual mas cercano, no haria falta hacer el max(fcorrect,1-fcorrect)
        % era i+1 hasta el 26/7/01
    else,
        countv=i:fin;
    end
   pvalue(count) = sum(p(countv)); 
end
