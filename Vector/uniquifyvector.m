function stripped = uniquify(vector)
% function stripped = uniquify(vector)
% Strips a vector of repeated values, returns unique values in the order 1st encountered
% AB Mar 2000
% To quantify how many occurrences of each, use hist(vector,largenumber)

stripped = vector(1);
for i = 2:length(vector),
  if ~any(stripped==vector(i)),
    stripped = [stripped,vector(i)];
  end
end
