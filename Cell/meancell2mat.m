function res=meancell2mat(cel)
% meanCELL2mat - Takes each element of CEL as a line and calculates the mean for each column
% CEL must be 1xNlines cell, each element of which is 1xNcol
% AB Feb 02

% Calculate longest element in cel
le=length(cel);
Nel=0;
for line=1:le,
    lel=length(cel{line});
    if lel>Nel,
        Nel=lel;
    end
end

% Convert cel to mat
m=Inf*ones(le,Nel);
for line=1:le,
    lel=length(cel{line});
    m(line,1:lel)=cel{line};
end

% Calculate mean over finite columns
for col=1:Nel,
    finiteind=isfinite(m(:,col));
    res(col)=mean(m(finiteind,col));
end