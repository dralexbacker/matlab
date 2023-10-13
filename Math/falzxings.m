function ZX=falzxings(x);
% function ZX=falzxings(x);
% Yields rising zero-crossings of x
% Modified from Mike's
%ZX is a row list of the indices of the zero-crossings
%of x, with *no linear interpolation*.
%returns ZX in samples.
% Will asign a zero-xing to the subindex *after* the crossing
% Will detect zero-touches that go back as well as zero-xings
% See ZERO_XINGS, ZXINGS, RISZXINGS, RISZERO_XINGS, RALZERO_XINGS
% AB Apr 20 1999

ZX=[];
a=1;
for i = 2:length(x)
        if sign(x(i))~=sign(x(i-1)) & sign(x(i))==-1,
                if (x(i-1) ~= 0)  % sign(0)=0 & u could get 2 signchgs/zx
                        ZX(a)=  i;
                        a=a+1;
                end %if (note: if (x(i-1) == 0) just skip i)
        end %if
end %for i
