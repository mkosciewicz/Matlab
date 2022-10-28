function [U_N] = U_neut(E_a, Z_a, Z_b, Z_c)

E_b = E_a*exp((2/3*pi())*1i);
E_c = E_a*exp((4/3*pi())*1i);

Y_a = 1/Z_a;
Y_b = 1/Z_b;
Y_c = 1/Z_c;

U_N = (E_a*Y_a + E_b*Y_b + E_c*Y_c)/(Y_a+Y_b+Y_c);

end
