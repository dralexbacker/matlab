
% Will calculate everything in today's $
principal = 274.500*.8 % 219,600 in thousands of $
annterm = 4 % years before sale of house
loan = 71%1515
for anndiscrate = .12,%[.1 .12 .15]; % discount rate
unmasdiscourate = (1+anndiscrate)^(1/12);

%lender = 'john'
%lender = 'bestrate4u' % 800-724-0004
lender = 'calfed'
for points = [0 0.5], % percentage

switch lender,
  case 'john',
    closcost = .275+.037+.079+.350+.250; % loan closing costs in thous of $991
   switch loan
   case 1515,  % comes out worse than 71
        points = 0;
        rate = 7.875;
        payment = 2.07141;
   case 71,
    switch points
      case 0 % percentage
        rate = 7.5; % percentage
        payment = 1.52708; % monthly payment in thousands of $
      case .5
        rate = 7.375;
        payment = 1.50843;
    end
   end
  case 'bestrate4u',
     closcost = .495+.450+.295+.057+.300;
%     rate = 7.125;
%     points = .875;

%    rate = 7.25;
%    points = .5;

    rate = 7.375;
    points = .25;
  case 'calfed'
    closcost = .750;
    points = .13;
    rate = 7.125;
        payment = 1.50843; % not real, copied from john
end

points = points/100;
morate = rate/100/12;
term = annterm*12; % months

if ~exist('payment'),
  
end

cost = closcost+points*principal;
outstanding(1) = principal;
for mo = 1:term,
  interes(mo) = morate*outstanding(mo);
  paidprinc(mo) = payment-interes(mo);
  outstanding(mo+1) = outstanding(mo) - paidprinc(mo);
  cost = cost + payment/unmasdiscourate^mo;
end
cost= cost + outstanding(term+1)/(unmasdiscourate^(term+1));
%cost = decplac(cost,3);
scost = sprintf('%0.6g',cost);
[num2str(anndiscrate),'    ',num2str(points),'     ',scost] %,'    ',num2str(sum(paidprinc))]

end % points
end % discrate
