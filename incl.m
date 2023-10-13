function included = incl(num,range)
% Yields TRUE if NUM is included in RANGE
% AB 2000

if any(num==range),
   included = 1;
else,
   included = 0;
end
