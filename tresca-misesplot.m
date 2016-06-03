clc 
clear

S = input('yeild stress')
K1 = input('Stress intensity factor')
v = input('Poisson ratio')
th = 0:1:360;

% plastic zone radius of plane stress condition

% (a)Mises yeild criterion
for i = 1:360
    r1(i) = (1/4*pi)*(K1/S)^2*(1+(3*sind(i).^2/2)+cosd(i));
    x1(i) = r1(i)*cosd(i);
    y1(i) = r1(i)*sind(i);
end
% (b)Tresca yeild criterion
for i = 1:360
    r2(i) = (1/2*pi)*(K1/S)^2*(cosd(i/2).*(1+sind(i/2)))^2;
    x2(i) = r2(i)*cosd(i);
    y2(i) = r2(i)*sind(i);
end

figure;

plot(x1,y1)
hold on
plot(x2,y2,'r')
xlabel('X')
ylabel('Y')
legend('Mises','Tresca')
axis equal
title('Plane stress')

% plastic zone radius of plane strain condition

% (a)Mises yeild criterion
for i = 1:360
    r3(i) = (1/4*pi)*(K1/S)^2*((3*sind(i).^2/2)+(1-2*v)^2*(1+cosd(i)));
    x3(i) = r3(i)*cosd(i);
    y3(i) = r3(i)*sind(i);
end
% (b)Tresca yeild criterion
for i = 1:360
    r4(i) = (1/2*pi)*(K1/S)^2*cosd(i/2).^2*(1-(2*v)+sind(i/2))^2;
    x4(i) = r4(i)*cosd(i);
    y4(i) = r4(i)*sind(i);
end

figure;
plot(x3,y3)
hold on
plot(x4,y4,'r')
xlabel('X')
ylabel('Y')
legend('Mises','Tresca')
axis equal
title('Plane strain')

