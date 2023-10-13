function initial_deposit = retirement(annual_ret_income,yrs2ret,yrsret,rate)

initial_deposit = 300; % Thousands of $

monatret = initial_deposit*rate^yrs2ret;
mon = monatret;
for i = 1:yrsret,
  mon = mon-annual_ret_income;
  mon = mon*rate;
end
mon

% For 40 yrs & 40 yrs (ret=66, death = 106)
% $24,000 initial for 10% rate
% $96,000 for 7% rate
