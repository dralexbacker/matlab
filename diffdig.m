function ans = diffdig(n,ndig)
% function ans = diffdig(n,ndig)
% Yields 1 if all digits of n are different from each other, 0 otherwise
% AB Dec 98

% Seems to work Dec 30, 98

nums = rjust(num2str(n),ndig,'0');

ans = 1;
quantn = zeros(1,10);
for i = 1:length(nums),
   numa(i) = str2num(nums(i));
   quantn(numa(i)+1)=quantn(numa(i)+1)+1;
   if quantn(numa(i)+1)>1,
      % digit repeated
      ans = 0;
      break
   end
end
