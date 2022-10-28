function [out_arg] = func_deriva(x_values, grad)
p = polyfit(x_values ,grad, 4);
syms x
func = p(1) * x^4 + p(2) * x^3 + p(3) * x^2 + p(4) * x + p(5);
derivative = diff(func);
derivative = sym2poly(derivative);
polynomial_values = polyval(derivative, x_values);

out_arg = polynomial_values;
end

