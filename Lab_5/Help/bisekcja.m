function [X_zera] = bisekcja(wektorX, wektorWartosci)
%BISEKCJA funkcja szukajaca miejsc zerowych funkcji za pomoca metody
%bisekcji

%Na początku sprawdzam czy funkcja nie przyjmuje wartości =0 na krańcach 
if wektorWartosci(1) == 0
    X_zera = wektorX(1);
    return
elseif wektorWartosci(end) == 0
    X_zera = wektorX(1);
    return
end


a = length(wektorX);
mid = ceil(a/2);

%sprawdza czy i z ktorej strony środka wektora funkcja zmienia wartosci z dodatnich
%na ujemne lub odwrotnie
check_left = wektorWartosci(1)*wektorWartosci(mid);
check_right = wektorWartosci(end)*wektorWartosci(mid);

% jesli wartosci funkcji dla srodka,prawegowo i lewego krańca mają takie
% same wartości przyjmuje że nie ma miejsc zerowych wewnątrz
if check_left > 0 && check_right >0 
    X_zera = nan;
    return
end
    

%zabezpiecznie na wypadek wartosci dyskretnych - besposredniego przejscia
%od wartosci minusowej do plusowej
if a < 3
   X_zera = wektorX(a);
   return
end 


%sprawdza czy funkcja przyjuje wartosc 0 dla x(środka) lub najbiższych mu
%wartosci
if wektorWartosci(mid) == 0 || wektorWartosci(mid-1) == 0 || wektorWartosci(mid+1) == 0 
    X_zera = wektorX(mid);
    return
else
%sprawdza czy wartosci funkcji maja przeciwne wartosci na prawo czy na lewo
%od srodka
    if check_left < 0
        wektorX = wektorX(1:mid);
        wektorWartosci = wektorWartosci(1:mid);
        
    elseif check_right <0 
        wektorX = wektorX(mid:a);
        wektorWartosci = wektorWartosci(mid:a);
    end
    % funkcja wywołuję się rekurencyjnie dla tej połowy wektora dla której
    % wartosci funkcji w punktach krancowych przyjmuja przeciwne wartosci
    X_zera = bisekcja(wektorX,wektorWartosci);


end

end
