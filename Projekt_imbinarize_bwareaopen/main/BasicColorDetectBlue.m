% Uzyskanie od użytkownika danych w postaci obrazu.

 mb='blue.png';         % Obrazek jest zapisywany w zmiennej.
 imb= imread(mb);

 % Do wyświetlania obrazu używana jest macierz 2x2, @ POS(1,1).
 subplot(3,3,1);         
 imshow(mb);               
 title('Obraz nieprzetworzony'); 

% Wykrywanie koloru czerwonego
  r=imb(:,:,1); g=imb(:,:,2); b=imb(:,:,3); 
  diff_blue=imsubtract(b,rgb2gray(imb));   % Wyodrębnianie czerwonych obiektów z obrazu w odcieniach szarości
  subplot(3,3,2);          
  imshow(diff_blue);               
 
  title('Obraz odejmowany');
  diff_b=medfilt2(diff_blue,[3 3]);       % Zastosowanie mediana
  subplot(3,3,3);          
  imshow(diff_b);               
  
  title('Zastosowanie mediana');  
  bw_b=ImbinarizeMtd(diff_b,0.2);    % Konwersja obrazu w skali szarości na obraz czarno-biały z wartością progową 0,2.
  subplot(3,3,4);          
  imshow(bw_b);               
  
  title('Binary Image');
  area_b=bwareaopen(bw_b,300);           % Aby usunąć obiekty o rozmiarze mniejszym niż 300 pikseli
  subplot(3,3,5);          
  imshow(area_b);               
  
  title('Odjęcie 300 pixeli');
  R=sum(area_b(:));                            % Wykorzystanie jako funkcji segregacji
  rm=r.*0;  gm=g.*0;  bm=immultiply(area_b,b); % Mnoży kolor czerwony wykrytego obiektu z kolor czerwonym w celu wizualizacji.
  subplot(3,3,6);          
  imshow(bm);               
  
  title('RGB złączone');
  image_r=cat(3,rm,gm,bm);                     %łączy wszystkie obrazy RGB
  subplot(3,3,7);          
  imshow(image_r);               
  
  title('Obraz połączony');
  subplot(3,3,9);
  imshow(image_r);                       
  
  title('Obraz końcowy');                               
 