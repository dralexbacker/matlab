function [rphasedistraxconcs,sig]=polarcell(sortedconc,sortedrates,LEGEND,STATS,rmax)
% Plots a polar plot of each element of SORTEDRATES labelled with SORTEDCONC
% AB Mar 02
% function [rphasedistraxconcs,sig]=polarcell(sortedconc,sortedrates,LEGEND,STATS,rmax)
%
% SORTEDCONC are labels. Can be vector or cell of strings
% LEGEND is 1 to plot legend, 0 otherwise
% STATS is 1 to compute statistics across elements, 0 otherwise
%
% If Nconcs>2, returns correlations of proportion of spikes distribution ax phases ax the max 2 concs (Spearman), & associated p-value

nbins=48;%36; 48=60 mejor q 36 mejor que 72
lw=1.5;

if nargin<3,
    LEGEND=1;
end
if nargin<4,
    STATS=1;
end
if nargin<5,
    rmax=[];
end

interv=2*pi/nbins;
bincenters=[-pi:interv:pi-interv];
angles=[bincenters,bincenters(1)];
Nconcs=length(sortedconc);
prop=[];
for i=Nconcs:-1:1,
    if ~isempty(sortedrates{i}),
        use(i)=1;
        [n]=hist(sortedrates{i},bincenters);
        currprop=n/sum(n);
        
        % To close circle:
        prop(i,:)=[currprop,currprop(1)];
        
        if iscell(sortedconc),
            label{i}=sortedconc{i};
        else,
            label{i}=num2str(sortedconc(i));
        end
    else,
        use(i)=0;
    end
end
if any(use),
    m=max(prop(:));
    [maxconc,maxphase]=find(prop==m);
    maxconc=maxconc(1);
    hold off
    h(maxconc)=polarab(angles,prop(maxconc,:),rmax); %,color(maxconc)); % returns handle for line
    set(h(maxconc),'Color',color3d(maxconc),'Linewidth',lw)
    hold on
    for i=Nconcs:-1:1,
        if use(i),
            temp=color(i);
            colo{i}=temp(1);
            linetype{i}=temp(2:end);
            h(i)=polarab(angles,prop(i,:)),rmax; %,color(i)); % returns handle for line
            set(h(i),'Color',color3d(i),'Linewidth',lw)
        end
    end
    if LEGEND,
        legend(h,label,-1)
    end
    if STATS,
        if Nconcs>1,
            conc1=Nconcs; % last
            conc2=Nconcs-1; % before last
            [rphasedistraxconcs,sig]=spearman(prop(conc1,:),prop(conc2,:))
        else,
            rphasedistraxconcs=[];sig=[];
        end
    else,
        rphasedistraxconcs=[];sig=[];
    end
else,
    rphasedistraxconcs=[];sig=[];
    set(gca,'Visible','off');
end