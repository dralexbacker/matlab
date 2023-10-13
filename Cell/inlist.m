function index=inlist(element,cel)
% index=inlist(element,cel)
% If ELEMENT is in cell ODLIST, returns the index of ODLIST that contains ELEMENT in INDEX
% Returns 0 otherwise
% AB Nov 01

if length(size(cel))>2,
    error('INLIST cell input must be size 1 or 2')
elseif min(size(cel))>1,
    error('INLIST cell input must have a single dimension larger than 1')
end

index=0;
for i=1:length(cel),
    if isequal(cel{i},element),
        index=i;
    end
end
