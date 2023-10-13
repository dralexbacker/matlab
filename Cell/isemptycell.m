function spikeless=spikeless(st)
% SPIKELESS
% function spikeless=spikeless(st)
% AB Jun 00
%
% ISEMPTY for cells: Yields 1 if cell ST has only empty elements, 0 otherwise.
%
% Same as ISEMPTYCELL

spikeless=1;
for i=1:length(st),
   if ~isempty(st{i}),
      spikeless=0;
      break
   end
   if ~spikeless,
      break
   end
end
