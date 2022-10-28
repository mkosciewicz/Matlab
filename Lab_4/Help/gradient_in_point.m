function result = gradient_in_point(point)
     x = point(1)-4:0.1:point(1)+4;
     y = point(2)-4:0.1:point(2)+4;
     [x, y] = meshgrid(x,y);
     z = (1.5 - x .* (1- y )).^2 + (2.25 - x .*(1- y.^2)).^2 + (2.625 - x .* (1- y.^3)).^2;
     [px, py] = func_derivative(z);
     middle = (4+4)/0.1/2;
     result = [-1*px(middle,middle) -1*py(middle,middle)];
end