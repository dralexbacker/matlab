function [lineh,errorh]=errorbarwlegend(x,y,errors,labels,SORT,plotstr)
% ERRORBARWLEGEND - Plots errorbar for each line in Y. LABELS{i} denotes line i.
% AB Feb 02
% [lineh,errorh]=errorbarwlegend(x,y,errors,labels,plotstr)
%
% LINEH: handles to lines joining points
% ERRORH: handles to errorbars (both vertial and horiz lines)
%
% If isempty(X), plots Y vs subindices
% If ~iscell(LABELS) and converts each element in LABELS to a string
% If SORT, sorts LABELS (highest on top in legend) 

if nargin<5,
    SORT=1;
end
if nargin<6,
    plotstr='';
end

clf
h=[]; 
if iscell(labels),
    concstr=labels;
else,
    concstr={};
    if SORT,
        [sortedlabels,i]=sort(labels);
        i=i(end:-1:1);
        labels=labels(i);
        y=y(i,:);
        errors=errors(i,:);
    end
end
Nseries=size(y,1);
for concN=1:Nseries,
    if isempty(x),
        ha=errorbar(y(concN,:),errors(concN,:),[color(concN),plotstr]);
    else,
        ha=errorbar(x,y(concN,:),errors(concN,:),[color(concN),plotstr]);
    end
    hold on
    errorh(concN)=ha(1);
    lineh(concN)=ha(2);
    if ~iscell(labels),
         concstr{concN}=num2str(labels(concN));
    end
end
legend(errorh,concstr); 
