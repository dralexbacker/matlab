function ndp=numdecplac(n)
% NUMDECPLAC - Returns # of decimal places in N
% AB Feb 02
% Those with infinite decimal places (e.g. irrationals & 1/3) will return 16, machine precision

ndp=0;
while 1,
    if isequal(n,decplac(n,ndp)),
        return;
    else,
        ndp=ndp+1;
    end
end
