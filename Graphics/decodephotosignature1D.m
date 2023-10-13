function binario=decodephotosignature1D(imagen,x)

if nargin<2,
    x=2:2:Nbits+1;
end

binario=zeros(size(x));
for i=1:length(x),
    binario(i)=imagen(x(i))>imagen(x(i)-1);
end
