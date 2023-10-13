%cell2txtfile
% Writes a text file each line of which is:
% domainname merchantname YelplonglinesreviewURL emailaddress1 emailaddress2 ...
% emailaddresses are optional and can have any #

filename='NYrestaurantslongwaitlonglines.txt'
matfilename= 'NYrestaurantslongwaitlonglines'%'QLessmailer'
newmatfilename=[matfilename,'postcell2txt'];
load(matfilename)
%merchantTLDs reviewsurlcell address
fid=fopen(filename,'w');
h=waitbar(0);
len=length(merchantTLDs);
for i=1:len,
    waitbar(i/len,h);
    %i
    if ~isempty(address{i}),
        if ~isequal(reviewsurlcell{i}(1),'?'), % it starts with ? for those where no long lines review was 
        % Find merchant name
            if length(merchantname)<i | isempty(merchantname{i}),
                merchantname{i}
                %buzz(.1)
                success=false;
                while ~success,
                    [reviewspage,success]=urlread(reviewsurlcell{i});
                    ['Error reading ',reviewsurlcell{i}]
                    pause(1);
                end
                merchantname{i}=textinbetween(reviewspage,'<h1>','</h1>');
            end
            stringtowrite=[merchantTLDs{i},'\t',merchantname{i},'\t',reviewsurlcell{i},'\t'];
            for j=1:length(address{i}),
                stringtowrite=[stringtowrite,address{i}{j},'\t'];
            end
            fprintf(fid,'%s',stringtowrite);
        end
    end
    fprintf(fid,'\n');
    if ~rem(i,10),
        save(newmatfilename,'location', 'query', 'merchantTLDs', 'reviewsurlcell', 'address', 'yelppage', 'NGoogleresults', 'yelpbaseurl', 'yelppage' ,'merchantnum', 'spideredcount', 'totalcount', 'searchedcount','merchantname','merchantyelppage')
    end
end
st=fclose(fid);
save(newmatfilename,'location', 'query', 'merchantTLDs', 'reviewsurlcell', 'address', 'yelppage', 'NGoogleresults', 'yelpbaseurl', 'yelppage' ,'merchantnum', 'spideredcount', 'totalcount', 'searchedcount','merchantname','merchantyelppage')
close(h)
