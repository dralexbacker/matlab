function hypercubedist(n)
% HYPERCUBEDIST
% AB Oct 01

for i=[0 1],
    v=vector(n,i);
end

function v=vector(n,b)

if n==1,
    v=b;
else,
    for i=[0 1],
        for j=[0 1],
            v=[i,vector(n-1,j)];
        end
    end
end


