function avg=geomavg(v,z)
% GEOMAVG - Returns geometric average of exponent Z for vector V
% avg=geomavg(v,z)
% AB Sep 01
% Deals with any zeros in V

nonzero=find(v);
if isempty(nonzero),
    prom=0;
else,
    Nzeros=length(v)-length(nonzero);
    a=v(nonzero);
    prom=mean([a.^z,zeros(1,Nzeros)]);
end
if prom,
    avg = prom^(1/z);
else,
    avg = 0;
end
