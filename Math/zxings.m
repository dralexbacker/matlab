function ZX=zxings(x);
% From Mike
%ZX is a row list of the indices of the zero-crossings
%of x, with *no linear interpolation*.
%returns ZX in samples.
% Will asign a zero-xing to the subindex *after* the crossing
% Will detect zero-touches that go back as well as zero-xings
% See also ZERO_XINGS, ZXINGS, FALZXINGS, RISZERO_XINGS, FALZERO_XINGS
% AB Apr 20 1999
% By definition, there are no xings at the first or last elements of X

%ZXr=zeros(1,length(x)-1);
ZX=[];
a=1;
for i = 2:length(x)
        if sign(x(i))~=sign(x(i-1))  % used to be ==- but missed 0's
                if (x(i-1) ~= 0)  % sign(0)=0 & u could get 2 signchgs/zx
                        ZX(a)=  i;
                        a=a+1;
                end %if (note: if (x(i-1) == 0) just skip i)
        end %if
end %for i
