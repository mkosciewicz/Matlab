% Dla danego obrazu CT napisac funkcje, która pozwala na
% 1) Wczytanie obrazu
% 2) Wczytanie przykładowego wektora wartosci x dla nerki (może być okreslone ręcznie) z pewnym otoczeniem
%
% Funkcja zwraca wartosci gradientu w każdym punkcie dla danych wejsciowych
% 
% Rezultat to
% "Narysowana funkcja oryginalna"
% 
% oraz gradient tej funkcji, spodziewamy się, że maksymalne wartości funkcji gradientu będą wyznaczać granice poszukiwanego organu
% 
% Pracujemy na wektorach
% Dla chętnych to samo zadanie dla macierzy (wtedy możliwe jest wyznaczenie 2 gradientów pxipy)

img = imread("CT-scan-bod.jpg");
imshow(img)



