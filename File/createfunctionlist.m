function [functionnames,graphmat]=createfunctionlist(dire,ext2use)
% 1st Part of FUNCTIONCALLTREEMATLABPOLYSEMY
% FunctionCallTree - Generates a tree of all calls between functions in
% dire
% AB Apr 03
% [functionnames,graphmat]=functioncalltree(dire,ext2use)

% Features:
% Does not count variables with functionnames.
% Manages multiple functions with same names well using MATLAB's
% which(A,'in',B) function.
% Does not actually change directory other than when needed, to prevent
% path to be altered by searching in local directory first, which could
% lead to incorrect functions being called when polysemy exists.

% May be counting variables as functions in calling functions with
% varargin? No, xq they will be described in text as varargin{i} rather
% than function name

% Can speed up inlist by making lookup table from simple unique fn of
% fnname to entry number

global graphmat functionnames Nf fnsread timebarh poly paths fnnum Nfnames maxNerrors

if nargin<1 | isempty(dire),
    dire=pwd;
end
if nargin<2 | isempty(ext2use),
    ext2use='m';
end

tic
cd(dire)
% Find all function names:
functionnames={};
poly=[]; paths={};
functionnames=findfunctions(functionnames,ext2use,dire);
Nfnames=length(functionnames); % # of distinct function names
Nf=Nfnames; % # of functions
fnnum=cell(1,Nfnames);

% Assign duplicate function names node numbers:
polyinds=find(poly);
for p=polyinds(:)',
    fnnum{p}(1)=p;
    Nduplicates=length(paths{p})-1; % 1st one not counted
    fnnum{p}(2:Nduplicates+1)=Nf+1:Nf+Nduplicates; % 1st one not counted
    Nf=Nf+Nduplicates;
end

% Add built-in functions:
for i=1:Nfnames,
    w=which(functionnames{i});
    if isequal(w,'built-in'),
        poly(i)=1;
        Nf=Nf+1;
        paths{i}{end+1}=w;
        fnnum{i}(1)=i;
        fnnum{i}(end+1)=Nf;
    end
end

save functionlist functionnames poly paths fnnum Nf Nfnames dire ext2use
return;




function functionnames=findfunctions(functionnames,ext2use,direc)

global poly paths

% Find all function names:
%p=pwd;
%cd(direc)
disp(pwd)
d=dir;
%cd(p)
nf=length(d);
for i=3:nf,
    if d(i).isdir & ~isequal(d(i).name,'ja'),
        %        direc=[direc,slash,d(i).name];
        cd(d(i).name)
        functionnames=findfunctions(functionnames,ext2use,direc);
        cd ..
        %        direc=preslash(direc);
    else,
        [name,ext]=extension(d(i).name);
        if (isequal(ext,'*') | isequal(ext,ext2use)),
            index=inlist(name,functionnames);
            if ~index,
                functionnames{end+1}=name;
                paths{end+1}{1}=[pwd,'\',d(i).name];
                poly(end+1)=0;
            else, % polysemy
                poly(index)=1;
                paths{index}{end+1}=[pwd,'\',d(i).name];
            end
        end
    end
end
return;