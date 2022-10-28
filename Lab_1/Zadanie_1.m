%Zadanie 1_1

A = [2 -7;5 4];
B = [6 1; 4 -3];
f = [4 1];

%Zadanie 1_2
size(A)
size(f)

Bt = B';

a1 = (A+B)^2;
a2 = 2*(A-B);
sum1 = a1+a2;

C = [A B];
h = [f f];

Ch = C * h';


%Zadanie 1_3

who
save dane;
clear;
ls

%Zadanie 1_4

x = 1:24;

Y = reshape(x,6,4);

%Zadanie 1_5

e1 = exp(2*sin(2*pi));
e2 = (cos(pi/3))^4;
e3 = log(sqrt(5));

%Zadanie 1_6

z = complex(3,-2);
f1 = abs(z);
f2 = angle(z);
f3 = conj(z);

%Zadanie 1_7

g1 = ones(3,4);
g2 = zeros (3,4);
g3 = rand(3,4);



