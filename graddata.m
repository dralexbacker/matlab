function dy=graddata(y,z)

% dy=graddata(y,z)
% derivative of the columns of y with respect to z
% evaluated with differences between adjacent data points

[n,m]=size(y);
z=z(:);

dy(1,:)=(y(2,:)-y(1,:))/(z(2)-z(1));
dy(n,:)=(y(n,:)-y(n-1,:))/(z(n)-z(n-1));

dy(2:n-1,:)=(y(3:n,:)-y(1:n-2,:))./((z(3:n)-z(1:n-2))*ones(1,m));

