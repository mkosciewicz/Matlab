% Uzyskanie od użytkownika danych w postaci obrazu.

 mr='red.jpg';         % Obrazek jest zapisywany w zmiennej.
 
 imr= imread(mr);
 
 % Do wyświetlania obrazu używana jest macierz 2x2, @ POS(1,1).
 subplot(3,3,1);         
 imshow(mr);               
 title('Obraz nieprzetworzony');

% Wykrywanie koloru czerwonego
  r=imr(:,:,1); g=imr(:,:,2); b=imr(:,:,3); 
  diff_red=imsubtract(r,rgb2gray(imr));   % Wyodrębnianie czerwonych obiektów z obrazu w odcieniach szarości
  subplot(3,3,2);          
  imshow(diff_red);               
 
  title('Obraz odejmowany');
  diff_r=medfilt2(diff_red,[3 3]);       % Zastosowanie mediana
  subplot(3,3,3);          
  imshow(diff_r);               
  
  title('Zastosowanie mediana');  
  bw_r=imbinarize(diff_r,0.2);    % Konwersja obrazu w skali szarości na obraz czarno-biały z wartością progową 0,2.
  subplot(3,3,4);          
  imshow(bw_r);               
  
  title('Binary Image');
  area_r=bwareaopen(bw_r,300);           % Aby usunąć obiekty o rozmiarze mniejszym niż 300 pikseli
  subplot(3,3,5);          
  imshow(area_r);               
  
  title('Odjęcie 300 pixeli');
  R=sum(area_r(:));                            % Wykorzystanie jako funkcji segregacji
  rm=immultiply(area_r,r);  gm=g.*0;  bm=b.*0; % Mnoży kolor czerwony wykrytego obiektu z kolor czerwonym w celu wizualizacji.
  subplot(3,3,6);          
  imshow(rm);               
  
  title('RGB złączone');
  image_r=cat(3,rm,gm,bm);                     %łączy wszystkie obrazy RGB
  subplot(3,3,7);          
  imshow(image_r);               
  
  title('Obraz połączony');
  subplot(3,3,9);
  imshow(image_r);                       
  
  title('Obraz końcowy');                               
 