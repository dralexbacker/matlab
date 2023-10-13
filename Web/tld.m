function tld=tld(url)
% Yields the TLD of a URL
% AB Dec 2008

dots=findstr(url,'.');
switch length(dots),
    case 0,
        error(['URL form improper:',url])
    case 1,
        tld=url;
    otherwise,
        tld=url(dots(end-1)+1:end);
end
        
  