function eqaxes()
% EQAXES
% Change current axes to equalize x and y, using the smallest minimum and the largest maximum
% AB Mar 98

		Xlim = get(gca,'XLim');
        Ylim = get(gca,'YLim');
        maxlim = max([Xlim,Ylim]);
        minlim = min([Xlim,Ylim]);
		newlim = [minlim,maxlim];
        set(gca,'Xlim', newlim, 'Ylim', newlim);
         
