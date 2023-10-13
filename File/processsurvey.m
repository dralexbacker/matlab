function [nf,Nvalid,count]=processsurvey()
% [nf,Nvalid,count]=processsurvey()
% Processes a multiple choice survey, counting X's within [ ] brackets
% Run in directory with all responses, each response a text file
% AB Oct 03
%
% NF = # of files/respondents
% Nvalid = # of respondents with the right # of answers and no missing
% brackets
% count(Nsurvey,responsenumber) has the corresponding number of X's
%
% Can be set to recognize multiple surveys by finding a text string within
% the response identifying the survey type
%
% Requires setting of rightNans, the # of answers for each survey

rightNans(1)=58; 
rightNans(2)=59; % Da Vinci Fall 03: 58 for survey1, 59 for survey 2
START=2; % 0 to discard surveys without a text identifier, 1 to use all as type 1
%str2=upper('X] Female');
str1='X-DATABASE:survey1';
str2='X-DATABASE:survey2';

TRUE=1;
count=zeros(2,max(rightNans));
respchar='X';

d=dir;
d=d(3:end);
nf=length(d);
Nvalid=0;
for r=1:nf,
    fid=fopen(d(r).name);
    l=0;
    surveytype=START;
    tline={};
        while TRUE
            l=l+1; % line #
            tline{l} = fgetl(fid);
            
            if findstr(str1,tline{l}),
                surveytype=1;
            elseif findstr(str2,upper(tline{l})),
                surveytype=2;
            end
            if ~ischar(tline{l}), break, end
%            disp(tline{l})
        end
        fclose(fid);
        if surveytype,
            [Nans,thiscount]=process(tline,zeros(1,max(rightNans)),surveytype,respchar);
            if Nans==rightNans(surveytype),
                Nvalid=Nvalid+1;
                count(surveytype,:)=count(surveytype,:)+thiscount;
            end
        end
    end
    
    for surveytype=1:2,
       % lab=labels(tline,surveytype);
        figure
        bar(count(surveytype,:))
    end
nf
Nvalid
count

    function [Nans,count]=process(response,count,surveytype,respchar)
    nl=length(response); % # of lines
    Nans=0;
    for i=1:nl,
        opencols=findstr('[',response{i});
        closecols=findstr(']',response{i});
        if length(opencols)~=length(closecols),
            response{i}
            warning('Non-matching brackets')
            break,
        end
        Nansthisline=length(opencols);
        for ans=1:Nansthisline,
            resp=upper(response{i}(opencols(ans):closecols(ans)));
            Nans=Nans+1;
            if Nans>size(count,2),
                warning('Too many answers')
                break,
            end
            if findstr(respchar,resp),
                count(Nans)=count(Nans)+1;
            end
        end
    end
    Nans
    
    function lab=labels(response);
    
