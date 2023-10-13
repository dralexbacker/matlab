function [fcalled,linea]=findcalls(filename,direc)
% Part of functioncalltreeMATLABpolysemy, for a single file
% AB Apr 03
% Needs debugging

% Not the same as copying filename to a new directory because you need the
% set of functions that are called

ext2use='m';
if nargin<2,
    direc=preslash(which(filename)); % otherwise use pwd;
end
Nf=1; paths=direc; fnnum=1; poly=0; maxNerrors=0;
i=1;

cd 'C:\MATLAB6p5\toolbox\matlab'
load functionlist
load functioncallgraph
%clear graphmat
%functionnames provided by file

Nfnames=length(functionnames);
linea=[];
Nlink=0;

[name,ext]=extension(filename);

d(i).name=filename;
if (isequal(ext,'*') | isequal(ext,ext2use)),
            p=pwd;
            cd(direc);
            t = textread(d(i).name,'%s','delimiter','\n','whitespace',''); % ea. element a line
            cd(p);
            args=fnargnames(t{1}); % Get argument names, to exclude from called function list for this calling function
            noe=length(t); % # of lines 
            callingfn=inlist(name,functionnames);
            graphmat(callingfn,:)=0;
            for k=1:Nfnames, % called function
                getout=0;
                for j=1:noe, % line # of calling function 
                    if ~isempty(t{j}) & t{j}(1) ~= '%' & (length(t{j})<8 | ~isequal(t{j}(1:8),'function')), % Exclude comment lines & function defs
                        if ~inlist(functionnames{k},args), % Exclude functionnames that are variable names in this calling function
                            if length(t{j})>=length(functionnames{k}),
                                f=findstr(functionnames{k},t{j});
                                if ~isempty(f),
                                    commstart=findstr('%',t{j});
                                    for m=1:length(f),
                                        if isempty(commstart) | f(m)<commstart, % ignore anything after a comment symbol
                                            % Check if no alphanumeric char before:
                                            %                                    if f(m)==1 | ~isalphanumeric(t{j}(f(m))),
                                            if f(m)==1 | isoperator(t{j}(f(m)-1)), 
                                                % Check if no alphanumeric char after:
                                                %                                        if f(m)+length(functionnames{k})==length(t{j}) | ~isalphanumeric(t{j}(f(m)+length(functionnames{k}))),
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
%                                                         if ~callingfn,
%                                                             callingfn=inlist(name,functionnames);
%                                                         end
                                                        if poly(k), % polysemy: several functions by that name
                                                            cd(direc)
                                                            calledpath=which(functionnames{k},'in',functionnames{callingfn});
                                                            cd(p)
                                                            if isempty(calledpath),
                                                                calledfnN=ceil(rand(1,length(fnnum{k}))); % If cannot identify which one, choose one randomly
                                                                graphmat(callingfn,calledfnN)=graphmat(callingfn,calledfnN)+1;
                                                            Nlink=Nlink+1;
                                                            linea(Nlink)=j;
                                                                maxNerrors=maxNerrors+1;
                                                                beep;
                                                                warning('Empty CALLEDPATH in FUNCTIONCALLTREEMATLABPOLYSEMY')
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
                                                            Nlink=Nlink+1;
                                                            linea(Nlink)=j;
                                                                end
                                                            end
                                                        else,
                                                            graphmat(callingfn,k)=graphmat(callingfn,k)+1;
                                                            Nlink=Nlink+1;
                                                            linea(Nlink)=j;
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

fcalled=functionnames(find(graphmat(callingfn,:)));