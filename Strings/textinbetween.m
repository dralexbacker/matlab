function textinbetween=textinbetween(string,textbefore,textafter,ALL)
% textinbetween=textinbetween(string,textbefore,textafter)
% Extracts the text in between the first occurrence of TEXTBEFORE and the first occurrence of TEXTAFTER thereafter in STRING
% AB Dec 2008
% ALL=1 finds all, 0 finds first

if nargin<4,
    ALL=0;
end

startv=findstr(textbefore,string)+length(textbefore);
finv=findstr(textafter,string)-1;
if ALL,
    for i=1:length(startv),
        start=startv(i);
        if length(finv)>1,
            finv=finv(find(finv>start));
            fin=finv;
            fin=fin(find(fin));
            fin=fin(1);
        end
        textinbetween{i}=string(start:fin);
    end

else,
    start=startv(1);
    fin=finv;
    if length(fin)>1,
        fin=fin(find(fin>start));
        fin=fin(find(fin));
        fin=fin(1);
    end
    textinbetween=string(start:fin);
end
