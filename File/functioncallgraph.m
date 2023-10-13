function [functionnames,graphmat]=functioncallgraph(dire,ext2use,LOAD)
% FunctionCallGraph - Generates a graph of all calls between files with EXT2USE extension in
% DIRE directory
% [functionnames,graphmat]=functioncallgraph(dire,ext2use)
%
% LOAD=1 to append to a previously created graph, 0 otherwise 
%
% Graph matrix of links (graphmat(i,j)=# of times fn i calls fn j
%
% Default arguments:
% DIRE = PWD
% EXT2USE = .m
% LOAD = 0
%
% Uses some global variables to speed up & simplify; if you want to avoid
% that, modify to use PERSISTENT, send arguments on first call to each function, and copy variables to different
% variablenames upon first call to each function below.
%
% See also MFILESUMMARY in the MATLAB Central File Exchange for text output.
% Note that MFILESUMMARY will consider *all* mentions of each filename in a
% file, as opposed to counting calls only. 
% TYPE FUNCTIONGRAPHTREE for details.
%
% Copyright Alex Backer April 2003

% Features:
% Does not count variables with function names.
% Copes with multiple functions with same names well using MATLAB's
% which(A,'in',B) function.
% Does not actually change directory other than when needed, to prevent
% path from being altered by searching in local directory first, which could
% lead to incorrect functions being called when polysemy exists.
% Does not count calls between quotes (').
% Multiplatform.

% Does not count variables as functions in calling functions with
% varargin: they will be described in text as varargin{i} rather
% than function name.

global graphmat functionnames Nf fnsread timebarh poly paths fnnum Nfnames maxNerrors callingfn

% For experts:
filename='functioncallgraph.mat';

if nargin<1 | isempty(dire),
    dire=pwd;
end
if nargin<2 | isempty(ext2use),
    ext2use='m';
end
if nargin<3 | isempty(LOAD),
    LOAD=0;
end

last=priority('sl'); % Work in the background

if LOAD,
    load(filename)
    direc=pwd;
else,
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
    
    % Add built-in functions: % They will only be detected if they have
    % same name as one in directory being scanned (i.e. as a non-built-in
    % one), but it's important to distinguish them from their polysemous
    % functions, plus it's correct to say built-in functions don't call any function in
    % this set, so not a problem that they are not listed among calling functions.
    % For that, it's important that they remain at the end in the fnnum
    % list.
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
    
    % Find all calls:
    % Could represent links as node pairs or as #nodesX#nodes matrix
    maxNerrors=0; % # of guessed links due to which.m error
    fnsread=0;
    callingfn=0;
    graphmat=sparse(zeros(Nf,Nf)); % Graph matrix of links (graphmat(i,j)=# of times fn i calls fn j
    direc=pwd;
end
timebarh=timebar(0);
findlinks(ext2use,direc);
%save fncalltree functionnames graphmat dire ext2use

close(timebarh);
elapsed=toc
secperfunction=elapsed/Nf
maxNerrors
Nlinks=sum(sum(graphmat))
maxperror=maxNerrors/Nlinks
save functioncallgraph
sendmail('alex@caltech.edu',['Functioncallgraph at ',pwd,' done'],['Here are ',pwd,' results.'], ...
              {'functioncallgraph.mat'});
return;


function findlinks(ext2use,direc)
% Find all calls:

global graphmat functionnames Nf fnsread timebarh paths fnnum poly Nfnames maxNerrors callingfn

disp(direc)
p=pwd;
cd(direc);
d=dir;
cd(p);
nf=length(d); % # of files
start=1;
if isequal(direc,'C:\MATLAB6p5\toolbox\matlab'), % To restart interrupted runs
    start=18;
end
for i=start:nf, % directory entry
    if ~isequal(d(i).name,'.') & ~isequal(d(i).name,'..'),
    if d(i).isdir & ~isequal(d(i).name,'ja'), % Ignore JA directories xq they are written in binary and they have same filenames as parent dirs
        direc=[direc,slash,d(i).name];
        findlinks(ext2use,direc);
        direc=preslash(direc);
    else,
%        callingfn=0; % 1 if figured out this calling function's name already (could keep track of order but would be susceptible to chgs in order b/w findfunctions & findlinks
        [name,ext]=extension(d(i).name);
        if (isequal(ext,'*') | isequal(ext,ext2use)),
            %callingfn=callingfn+1;
            disp(name)
            fnsread=fnsread+1/Nf;
            timebar(fnsread,timebarh);
            %t=textread(d(i).name,'%q'); % each element an expression
            p=pwd;
            cd(direc);
            t = textread(d(i).name,'%s','delimiter','\n','whitespace',''); % ea. element a line
            cd(p);
            args=fnargnames(t{1}); % Get argument names, to exclude from called function list for this calling function
            noe=length(t); % # of lines 
                                                                callingfnname=inlist(name,functionnames);
                                                                if poly(callingfnname),
                                                                    currpathandname=[direc,slash,d(i).name];
                                                                    in=inlist(currpathandname,paths{callingfnname});
                                                                    callingfn=fnnum{callingfnname}(in);
                                                                else,
                                                                    callingfn=callingfnname;
                                                                end
            graphmat(callingfn,:)=0; % Necessary for restarts; otherwise adds to previous run
            for k=1:Nfnames, % called function
                getout=0;
                for j=1:noe, % line # of calling function 
                    if ~isempty(t{j}) & t{j}(1) ~= '%' & (length(t{j})<8 | ~isequal(t{j}(1:8),'function')), % Exclude comment lines & function defs
                        if ~inlist(functionnames{k},args), % Exclude functionnames that are variable names in this calling function
                            if length(t{j})>=length(functionnames{k}),
                                f=findstr(functionnames{k},t{j}); % starting pos of each occurrence of called function name in current line
                                if ~isempty(f),
                                    commstart=findstr('%',t{j});
                                    quotepos=findstr('''',t{j});
                                    for m=1:length(f),
                                        if isempty(commstart) | f(m)<commstart, % ignore anything after a comment symbol
                                            numquotesbefore=sum(quotepos<f(m)); % previously length(find(quotepos<f(m)))
                                            if ~rem(numquotesbefore,2), % ignore anything between ' quotes. This does not get tricked by ' '' '
                                                if f(m)==1 | isoperator(t{j}(f(m)-1)), 
                                                    cond=0;
                                                    if f(m)+length(functionnames{k})-1>=length(t{j}),
                                                        cond=1;
                                                    else,
                                                        nextchar=t{j}(f(m)+length(functionnames{k}));
                                                        if isoperator(nextchar),
                                                            if nextchar~='.',
                                                                cond=1;
                                                            elseif  length(t{j})>=f(m)+length(functionnames{k})+1 & ~isalphanumeric(t{j}(f(m)+length(functionnames{k})+1)), % records w/ a.b struc are not functions
                                                                cond=1;
                                                            end
                                                        end
                                                    end
                                                    if cond, 
                                                        % Not part of another function name or
                                                        % variable name
                                                        textpostfnref=t{j}(f(m)+length(functionnames{k}):end);
                                                        textpostfnref=elimchar(textpostfnref,' ');
                                                        f1=findstr(textpostfnref,'=');
                                                        f2=findstr(textpostfnref,'==');
                                                        if ~isempty(f1) & f1(1)==1 & (isempty(f2) | f2(1)>1),
                                                            % it's being assigned a
                                                            % value, so it is
                                                            % variable, not
                                                            % function, so skip
                                                            % this called fn name
                                                            getout=1;
                                                            break; % out of for m
                                                        else,
                                                            if poly(k), % polysemy: several functions by that name
                                                                cd(direc)
                                                                calledpath=which(functionnames{k},'in',functionnames{callingfnname});
                                                                cd(p)
                                                                if isempty(calledpath), % No called fn by that name in the context of callingfn, seems to be a bug in WHICH.M
                                                                    calledfnN=ceil(rand(1,length(fnnum{k}))); % If cannot identify which one, choose one randomly
                                                                    graphmat(callingfn,calledfnN)=graphmat(callingfn,calledfnN)+1;
                                                                    maxNerrors=maxNerrors+1;
                                                                    %beep;
                                                                    warning(['Empty CALLEDPATH in FUNCTIONCALLTREEMATLABPOLYSEMY: ',functionnames{k},' in ',functionnames{callingfnname}])
                                                                else,
                                                                    in=inlist(calledpath,paths{k});
                                                                    if in, % otherwise it's a call to a node outside of the network analyzed, could count it but it would skew the comparison b/w fwd & bkwd links xq we can't see fwd links from those nodes
                                                                        % so we
                                                                        % ignore
                                                                        % calls to
                                                                        % outside
                                                                        % the
                                                                        % network
                                                                        calledfnN=fnnum{k}(in);
                                                                        graphmat(callingfn,calledfnN)=graphmat(callingfn,calledfnN)+1;
                                                                    end
                                                                end
                                                            else,
                                                                graphmat(callingfn,k)=graphmat(callingfn,k)+1;
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if getout,
                                        break; % out of for j
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
return;


function functionnames=findfunctions(functionnames,ext2use,direc)

global poly paths

% Find all function names:
p=pwd;
cd(direc)
disp(pwd)
d=dir;
cd(p)
nf=length(d);
for i=1:nf,
    if ~isequal(d(i).name,'.') & ~isequal(d(i).name,'..'),
        if d(i).isdir,
            if ~isequal(d(i).name,'ja'),
                direc=[direc,slash,d(i).name];
                %cd(d(i).name)
                functionnames=findfunctions(functionnames,ext2use,direc);
                %cd ..
                direc=preslash(direc);
            end
        else,
            [name,ext]=extension(d(i).name);
            if (isequal(ext,'*') | isequal(ext,ext2use)),
                index=inlist(name,functionnames);
                if ~index,
                    functionnames{end+1}=name;
                    paths{end+1}{1}=[direc,slash,d(i).name];
                    poly(end+1)=0;
                else, % polysemy
                    poly(index)=1;
                    paths{index}{end+1}=[direc,slash,d(i).name];
                end
            end
        end
    end
end
return;