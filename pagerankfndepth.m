function pagerankfndepth(maxNmoves)

for depth=1:maxNmoves,
    pr(depth,:)=mypagerankdynprog(depth);
end
%figure
plot(pr)
xlabel('# of steps')
ylabel('Probability')
