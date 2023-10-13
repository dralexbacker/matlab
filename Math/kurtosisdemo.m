function kurtosisdemo
% Shows variance of # of spikes in a bin agrees better w/intuition than
% kurtosis of the frequency histogram

% From max to min kurtosis:
v=[5*ones(1,8),4];
v=v./mean(v);

lenv=length(v);
count=0;
x=[];
while count<lenv;
    x=[x,ones(1,v(count+1))*count]; % 1st position corresponds to zero spikes
    count=count+1;
end
vari=var(x)

figure
bar(v)
kurtosis(v)
% Why is this greater than U shaped?

v=[5 4 3 2 1 2 3 4 5];
v=v./mean(v);

lenv=length(v);
count=0;
x=[];
while count<lenv;
    x=[x,ones(1,v(count+1))*count]; % 1st position corresponds to zero spikes
    count=count+1;
end
vari=var(x)

figure
bar(v)
kurtosis(v)

v=[0,0,5*ones(1,5),0,0];
v=v./mean(v);

lenv=length(v);
count=0;
x=[];
while count<lenv;
    x=[x,ones(1,v(count+1))*count]; % 1st position corresponds to zero spikes
    count=count+1;
end
vari=var(x)

figure
bar(v)
kurtosis(v)

