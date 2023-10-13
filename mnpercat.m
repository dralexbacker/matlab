function [cats,means,valuespercat]=mnpercat(values,categories,minN)
% [cats,means]=mnpercat(values,categories)
% Returns mean value in VALUES for each category, where ea. element in CATEGORIES gives the category of the corresponding value in VALUES
% Also returns a cell VALUESPERCAT with the values in each category
% AB Jul 01

cats=uniquify(categories);
for i=1:length(cats),
    valuespercat{i}=values(find(categories==cats(i)));
    if length(valuespercat{i})>=minN,
        means(i)=mean(valuespercat{i});
    else,
        cats(i)=-1;
    end
end
keepind=find(cats>=0);
cats=cats(keepind);
means=means(keepind);
valuespercat=valuespercat(keepind);
