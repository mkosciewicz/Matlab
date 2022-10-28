clc;
close;
close all;

x = [1 2 5 3];
y = [0 1 2 2];

xx = linspace(0, 6, 11);
yy = spline(x, y, xx);

figure;
plot(x, y, 'ro');
hold on;
plot(xx, yy, 'b', 'LineWidth', 1.5);
legend('Data Points', 'Spline Model');
grid on;