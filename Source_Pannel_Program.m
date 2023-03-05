clc;

n=8;
dx=4/n;
xi=1:n+1;

for i= 1:n/2
    xi(1,i+1)=xi(1,i)-dx
end
for i= n/2+1:n
    xi(1,i+1)=xi(1,i)+dx
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%z top
theta = 0.000001:1:deg2rad(180);

e = 0.0721; 
a = 0.574; 
k = 1.889; 
r1 = sqrt((a.*cos(theta)-a).^2+a^2.*(sin(theta)).^2);
r2 = sqrt((a.*cos(theta)-e*a).^2+a^2*(sin(theta)).^2);
theta1 = atan2((a*sin(theta)),(a*cos(theta)-a));
theta2 = atan2((a*sin(theta)),(a*cos(theta)-e.*a));
x = (r1.^k./r2.^(k-1)).*(cos(k.*theta1).*cos((k-1).*theta2)+sin(k.*theta1).*sin((k-1).*theta2));
ztop = (r1.^k./r2.^(k-1)).*(sin(k.*theta1).*cos((k-1).*theta2)-cos(k.*theta1).*sin((k-1).*theta2));

zi=interp1(x,ztop,xi)

%z bottom
theta = deg2rad(181):1:deg2rad(360);

r1 = sqrt((a.*cos(theta)-a).^2+a^2.*(sin(theta)).^2);
r2 = sqrt((a.*cos(theta)-e*a).^2+a^2*(sin(theta)).^2);
theta1 = atan2((a*sin(theta)),(a*cos(theta)-a));
theta2 = atan2((a*sin(theta)),(a*cos(theta)-e.*a));
x = (r1.^k./r2.^(k-1)).*(cos(k.*theta1).*cos((k-1).*theta2)+sin(k.*theta1).*sin((k-1).*theta2));
zbot = (r1.^k./r2.^(k-1)).*(sin(k.*theta1).*cos((k-1).*theta2)-cos(k.*theta1).*sin((k-1).*theta2));

zi=interp1(x,zbot,xi)

%zeta=.5*(xi+x(i+1))
%eta=.5*(zi+z(i+1))
%rij=(((zetai-zetaj).^2)+((etai-etaj).^2)).^.5
%phiij=atan2((etaj-etai)./(zetaj-zetai))
%thetai=atan2((z(i+1)-zi)./(x(i+1)-x))
%cij=(ds.*sin(thetai-phiij))./(2*pi.*rij)
%cijbar ?
%ds ?



%%%%%%%%%%

figure(n)
plot(xi,zi);
title('Pannel Geometry')
xlabel 'x';
ylabel 'z';

xlim([-2 0])
ylim([-.6 .6])
hold on


theta = 0.000001:0.0001:deg2rad(360);
e = 0.0721; 
a = 0.574; 
k = 1.889; 
r1 = sqrt((a.*cos(theta)-a).^2+a^2.*(sin(theta)).^2);
r2 = sqrt((a.*cos(theta)-e*a).^2+a^2*(sin(theta)).^2);
theta1 = atan2((a*sin(theta)),(a*cos(theta)-a));
theta2 = atan2((a*sin(theta)),(a*cos(theta)-e.*a));
x = (r1.^k./r2.^(k-1)).*(cos(k.*theta1).*cos((k-1).*theta2)+sin(k.*theta1).*sin((k-1).*theta2));
z = (r1.^k./r2.^(k-1)).*(sin(k.*theta1).*cos((k-1).*theta2)-cos(k.*theta1).*sin((k-1).*theta2));

plot (x,z)





