%  1) Stworz walsna metode znajdywania 0 metoda bisekcji 
% 2) zaimplementuj tę metode dla znajdywania obrysu czerniaka 
% 
% sprawozdanie: 
% wyjasnienie metody bisekcji
% + autorski kod 
% + wyniki dla przykładowego obrazu 
% + pokazac przykładowy wykres ze znalezionym miejscem zerowym 
% + mapa miejsc zerowych (tak naprawdę obrys czerniaka) 

img = imread('OIP.jpg');
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

zdjecie = r;
wysokosc = size(r,1);
szerokosc = size(r,2);

srodek = ceil(szerokosc/2);

Xlewy = ones(1,wysokosc);
Xprawy = ones(1,wysokosc);


for linia = 1:wysokosc
    LEWA = r(linia, [1:srodek]);
    PRAWA = r(linia, [srodek:end]);
    
    Xlewy(linia) = BISEKCJA([1:srodek],LEWA);
    Xprawy(linia) = BISEKCJA([srodek:szerokosc],PRAWA);
end

Xlewy = Xlewy';
Xprawy = Xprawy';
X = [Xlewy,Xprawy];

OBRYS = ones(size(r));


for index = 1 : size(OBRYS,1)
    Czarne = X(index,:);
    Czarne = length(Czarne);
    for Piksele = 1:Czarne
        if isnan(X(index,Piksele)) == false
            num = X(index,Piksele);
            OBRYS(index,num) =-100;
        end
    end
end


imshow(OBRYS)
figure
plot(r(100,[1:end]))
   


