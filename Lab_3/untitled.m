clc;clear;close;
img = imread('FISH_Her2.jpg');
% figure, imshow(img)
% G = img(:,:,3);
% figure, imshow(G)
%imshow(img)
x = 0:1:1280;
y = 0:1:1280;
N = length(x);
V = impixel(img,x,y);
Z = zeros(length(V),length(V));

j=1;
f=1;
for i=2:2:2*N    
    Z(i,f:f+2)          =   [x(j)^2 x(j) 1];
    V(i)                =   y(j);
    j                   =   j+1;
    Z(i+1,f:f+2)        =   [x(j)^2 x(j) 1];  
    V(i+1)              =   y(j);
    f                   =   f+3;
end
% Matryca wypełniająca (wygładzania)
j=1;
l=2;
for i=2*N+2:3*N
    
    Z(i,j:j+1)            =   [2*x(l) 1];
    Z(i,j+3:j+4)          =   [-2*x(l) -1];
    j                     =   j+3;
    l                     =   l+1;
end
% Ustawienie wartości a1 = 0
Z(1,1)=1;
% Odwrócenie i obliczenie współczynników, Wykres
Coeff       =       Z\V;
j=1;
hold on;
for i=1:N
    curve=@(l) Coeff(j)*l.^2+Coeff(j+1)*l+Coeff(j+2);
    fplot(curve,[x(i),x(i+1)]);
    hndl=get(gca,'Children');
    set(hndl,'LineWidth',2);
    hold on
    j=j+3;
end
scatter(x,y,50,'r','filled')
grid on;
xlim([min(x)-2 max(x)+2]);
ylim([min(y)-2 max(y)+2]);
xlabel('x');
ylabel('y');
title('Quadratic Spline')

% HSV = rgb2hsv(img);
% 
% R = img(:,:,1) < 0.2;
% G = img(:,:,2) > 0.3 & HSi(:,:,2) < 0.7;
% B = img(:,:,3) > 0.2 & HSV(:,:,3) < 0.6;
% mask = R & G & B;
% BW = bwareafilt(mask,[30 inf]);
% filtered_RGB = img .* uint8(BW);
% imshow(filtered_RGB)


