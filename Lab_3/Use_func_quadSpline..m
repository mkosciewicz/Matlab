x = 1:10;
y = x.^2 + 5 + rand(size(x))*10;

xq = linspace(0,10);
yq = func_quadSpline(x, y, xq);

plot(x, y, 'r+', 'MarkerSize', 10, 'LineWidth', 2);
hold on
plot(xq, yq, 'b-');