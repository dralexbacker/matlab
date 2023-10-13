function setxtick(xvalues,xlabels,Nticks)
% SETXTick - Sets XTick & XTickLabel to Nticks ticks such that rounded XLABELS are shown in their correct positions
% AB Feb 02
% setxtick(xvalues,xlabels,Nticks)
%
% XVALUES: values from X-axis corresponding to labels in XLABELS (Minimum 2 of each). Default XVALUES & XLABELS: axis(1:2).
% NTicks: # of intervals desired (# of ticks + 1)

if isempty(xvalues),
    ejes=axis;
    xvalues=ejes([1 2]);
end
if isempty(xlabels),
    ejes=axis;
    xlabels=ejes([1 2]);
end

valdif=xvalues(end)-xvalues(1); 
intervtime=sigfig((xlabels(end)-xlabels(1))/Nticks,1);
Ndecplace=numdecplac(intervtime);
labels=decplac(xlabels(1):intervtime:xlabels(end),Ndecplace);
tickpos=labels/(xlabels(end)-xlabels(1))*valdif;
set(gca,'XTick',tickpos,'XTickLabel',labels)
