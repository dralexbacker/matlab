function h = barebs(m,eb,cm,ceb,p,star1val,star2val,star3val)
% BAREBS    - Bar chart with Error Bars & Significace labels
% function done = barebs(m,eb,cm,ceb,p,star1val,star2val,star3val)
%
% Returns a vector of patch handles to the main bars
%
% m = mean measurement
% eb = error bar magnitude (>=0)
% m(i,j) is for series i, bar j
% cm = 1-letter string to denote color of main bar
% ceb = 1-letter string to denote color of error bar
% p(i) = p-value that m(i,1) is different than m(i,2) 
% star1val = p-value considered significant for 1 star (default 0.05)
% star2val = p-value considered significant for 2 stars (default 0.01)
% star3val = p-value considered significant for 3 stars (default 0.001)
%
% AB Apr 2000

ms= 25;%15; % marker size
fs = 11; %15; % font size
cs1='g';
cs2='y';
cs3='r';
ns = size(m,1); % # of series
if ns==1,
    nsd=length(m);
else,
    nsd=ns;
end

if ~exist('cm','var'), % | isempty(cm),
    cm = 'k';
    %cm='w'; and patch instead of bar for error bars
end
if ~exist('ceb','var') | isempty(ceb),
    ceb = 'g';
end
%if ~exist('p','var') | isempty(p),
%  p = ones(ns,1);
%end
if ~exist('star1val','var') | isempty(star1val),
    star1val = .05;
end
if ~exist('star2val','var') | isempty(star2val),
    star2val = .01;
end
if ~exist('star3val','var') | isempty(star3val),
    star3val = .001;
end

hold off
ebh = m+sign(m).*eb; % error bar height
if isempty(cm),
    h=bar([1:nsd],m);
else,      
    h=bar([1:nsd],m,cm);
end
hold on
h1=bar([1:nsd],ebh,0.1,ceb);
for i=1:length(h1),
    set(h1(i),'EdgeColor','none')
end
if isempty(cm),
    h2=bar([1:nsd],m-sign(m).*eb,0.1);
    for i=1:length(h2),
        set(h2(i),'EdgeColor','none')
    end
else,
    bar([1:nsd],m-sign(m).*eb,0.1,cm)
end

% Significance labels
if exist('p','var') & ~isempty(p),
    for series=1:ns, % series are each group within which there is one or more comparisons to be made
        if ns==1, % If there's only 1 series, each bar is placed at xpos=barnum
            if p(series)<star3val,
                plot(1.5-.07,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)
                plot(1.5,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)    
                plot(1.5+.07,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)        
            elseif p(series)<star2val,
                plot(1.5-.05,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)
                plot(1.5+.05,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)    
            elseif p(series)<star1val,
                plot(1.5,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms)
            else,
                text(1.5,max(ebh(series,:))*1.1,'N.S.','Color',ceb,'Fontsize',fs)
            end
        else,      % If there's multiple series, each series is centered at xpos=seriesnum
            if p(series)<star3val,
                plot(series-.07,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs3)
                plot(series,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs3)    
                plot(series+.07,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs3)        
            elseif p(series)<star2val,
                plot(series-.05,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs2)
                plot(series+.05,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs2)    
            elseif p(series)<star1val,
                plot(series,max(ebh(series,:))*1.1,['*',ceb],'Markersize',ms,'Color',cs1)
            else,
                text(series,max(ebh(series,:))*1.05,'N.S.','Color',ceb,'Fontsize',fs)
            end
        end
    end
end
ejes=axis;
m=max(max(ebh));
if m>0,
    ejes(4)=m*1.15;
else,
    ejes(4)=m*.85;
end
axis(ejes);
done = 1;