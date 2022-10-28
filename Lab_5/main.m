% 1) Stworz walsna metode znajdywania 0 metoda bisekcji 
% 2) zaimplementuj tę metode dla znajdywania obrysu czerniaka 
% 
% sprawozdanie: 
% wyjasnienie metody bisekcji
% + autorski kod 
% + wyniki dla przykładowego obrazu 
% + pokazac przykładowy wykres ze znalezionym miejscem zerowym 
% + mapa miejsc zerowych (tak naprawdę obrys czerniaka) 

clc;clear;close;
img = imread('p.jpg');
img = double(img)-100;
imshow(img);

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

figure, 
imshow(r)
hold on
imshow(g)
hold on
imshow(b)


photo = r;

H = size(r,1);
% fprintf("%d",H)
W = size(r,2);

mid = ceil(W/2);

left_x = ones(1,H);
right_x = ones(1,H);


for versus = 1:H
    L = r(versus, 1:mid);
    R = r(versus, mid:end);
    
    left_x(versus) = bisect(1:mid,L);
    right_x(versus) = bisect(mid:W,R);
end

left_x = left_x';
right_x = right_x';
value_x = [left_x,right_x];

range = ones(size(r));

for index = 1 : size(range,1)
    Negative = value_x(index,:);
    Negative = length(Negative);
    for pexels = 1:Negative
        if isnan(value_x(index,pexels)) == false
            num = value_x(index,pexels);
            range(index,num) =-100;
        end
    end
end


imshow(range)
figure
plot(r(100,1:end))
   



