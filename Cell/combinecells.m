function [spktlin,classstart,classend]=combinecells(st,celrange)
% COMBINECELLS - Combine spike times from several cells into one set of rasters for each odor/conc combination
% AB Mar 02
% [spkt,classstart,classend]=combinecells(st,celrange)
%
% Returns SPKTLIN{tria} and CLASSSTART & CLASSEND
%
% ST{celnum}{od}{conc}
% Default CELRANGE = 1:length(ST)

if nargin<2,
    celrange=1:length(st);
end

spktlin={};classstart=[];classend=[];
Nods=length(st{1});
for od=1:Nods,
    Nconcs=length(st{1}{od});
    classstart=[classstart,length(spktlin)+1];
    for conc=1:Nconcs,
        for celnum=celrange, 
            if celnum==1,
                spkt{od}{conc}={};
            end
            spkt{od}{conc}=fusecells(spkt{od}{conc},st{celnum}{od}{conc}); 
        end
        spktlin=[spktlin,spkt{od}{conc}];
    end
    classend=[classend,length(spktlin)];
end
