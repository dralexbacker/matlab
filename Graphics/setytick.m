function setytick(xvalues,xlabels,Nticks)
% SETYTick - Sets YTick & YTickLabel to Nticks ticks such that rounded YLABELS are shown in their correct positions
% AB Feb 02
% setxtick(yvalues,ylabels,Nticks)
%
% YVALUES: values from Y-axis corresponding to labels in YLABELS (Minimum 2 of each). Default YVALUES & YLABELS: axis(3:4).
% NTicks: # of intervals desired (# of ticks + 1)

if isempty(xvalues),
    ejes=axis;
    xvalues=ejes([3 4]);
end
if isempty(xlabels),
    ejes=axis;
    xlabels=ejes([3 4]);
end

valdif=xvalues(end)-xvalues(1); 
intervtime=sigfig((xlabels(end)-xlabels(1))/Nticks,1);
Ndecplace=numdecplac(intervtime);
labels=decplac(xlabels(1):intervtime:xlabels(end),Ndecplace);
tickpos=labels/(xlabels(end)-xlabels(1))*valdif;
set(gca,'YTick',tickpos,'YTickLabel',labels)
