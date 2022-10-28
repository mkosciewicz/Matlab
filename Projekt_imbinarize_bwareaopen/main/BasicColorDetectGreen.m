clc;clear;close;
% Uzyskanie od użytkownika danych w postaci obrazu.

 mg='green.jpeg';         % Obrazek jest zapisywany w zmiennej.
 imgr= imread(mg);

 % Do wyświetlania obrazu używana jest macierz 2x2, @ POS(1,1).
 subplot(3,3,1);         
 imshow(mg);               
 title('Obraz nieprzetworzony'); 

% Wykrywanie koloru czerwonego
  r=imgr(:,:,1); g=imgr(:,:,2); b=imgr(:,:,3); 

  diff_green=imsubtract(g,rgb2gray(imgr));   % Wyodrębnianie czerwonych obiektów z obrazu w odcieniach szarości
  subplot(3,3,2);          
  imshow(diff_green);               
 
  title('Obraz odejmowany');
  diff_g=medfilt2(diff_green,[3 3]);       % Zastosowanie mediana
  subplot(3,3,3);          
  imshow(diff_g);               
  
  title('Zastosowanie mediana');  
  bw_g=ImbinarizeMtd(diff_g,0.2);    % Konwersja obrazu w skali szarości na obraz czarno-biały z wartością progową 0,2.
  subplot(3,3,4);          
  imshow(bw_g);               
  
  title('Binary Image');
  area_g=bwareaopen(bw_g,300);           % Aby usunąć obiekty o rozmiarze mniejszym niż 300 pikseli
  subplot(3,3,5);          
  imshow(area_g);               
  
  title('Odjęcie 300 pixeli');
  R=sum(area_g(:));                            % Wykorzystanie jako funkcji segregacji
  rm=r.*0;  gm=immultiply(area_g,g);  bm=b.*0; % Mnoży kolor czerwony wykrytego obiektu z kolor czerwonym w celu wizualizacji.
  subplot(3,3,6);          
  imshow(gm);               
  
  title('RGB złączone');
  image_g=cat(3,rm,gm,bm);                     %łączy wszystkie obrazy RGB
  subplot(3,3,7);          
  imshow(image_g);               
  
  title('Obraz połączony');
  subplot(3,3,9);
  imshow(image_g);                       
  
  title('Obraz końcowy');                               
 