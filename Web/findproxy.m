function [host,puerto]=findproxy

GOOGLE=false; % Don't need to test Google because using API

success=false;
while ~success,
    [page,success]=urlread('http://www.publicproxyservers.com/page1.html');
    buzz(1)
end
%lookingfor=['<td align="left" height=17>[0-9\.]\</td>'];
%IPaddr=regexp(page,lookingfor,'match')
IPaddr=textinbetween(page,'<td align="left" height=17>','</td>',1);
%lookingfor=['<td align="left" height=17>',[0-9],'\</td>'];
%port=regexp(page,lookingfor,'match')
port=textinbetween(page,'<td height=17>','</td>',1);
save proxies IPaddr port
if ~isequal(size(IPaddr),size(port)),
    buzz
    'Host list and port list of different lengths'
end

%keyboard
works=false; host=[];puerto=[];
h=timebar(0);
len=length(IPaddr);
for i=1:len,
    timebar(i/len,h);
    com.mathworks.mlwidgets.html.HTMLPrefs.setUseProxy(1);
    com.mathworks.mlwidgets.html.HTMLPrefs.setProxyHost(IPaddr{i});
    com.mathworks.mlwidgets.html.HTMLPrefs.setProxyPort(port{i});
    com.mathworks.mlwidgets.html.HTMLPrefs.setProxySettings;
    [yelppage,success]=urlread('http://www.yelp.com/');
    if success,
        if ~isempty(findstr('Restaurants, Dentists, Bars, Beauty Salons, Doctors',yelppage)),
            %isempty(findstr('<title>400 Bad Request</title>',yelppage)),
            %<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
            %<html><head>
            %<title>400 Bad Request</title>
            if GOOGLE,
            [googlepage,success]=urlread('http://www.google.com');
                if success,
                    if isempty(findstr('<title>40',googlepage)),
                        works=true;
                        host=IPaddr{i}; puerto=port{i};
                        'Found a working proxy', num2str(i)
                        yelppage(1:100)
                        googlepage(1:100)
                        break;
                    end
                end
            else,
                  works=true;
                        host=IPaddr{i}; puerto=port{i};
                        'Found a working proxy', num2str(i)
                        yelppage(1:400)
                        
                        break;
            end
        end
    end
end
close(h);

            


