define N 20

int main()
{
  int c, elem_pierwszy, elem_ostatni, elem_srodkowy, elem_szukany, wektor[20];

  printf("Wprowadz %d liczby\n", N);

  for (c = 0; c < N; c++)
    scanf("%d", &wektor[c]);

printf("Wprowadz wartosc szukana\n");
  scanf("%d", &elem_szukany);
  

 elem_pierwszy = 0;
 elem_ostatni = N - 1;
 elem_srodkowy = (elem_pierwszy + elem_ostatni) / 2;

 while(elem_pierwszy <= elem_ostatni)
 {
     if (elem_szukany < wektor[elem_srodkowy])
     {
         elem_ostatni = elem_srodkowy - 1;
     }
         
     else if (elem_szukany > wektor[elem_srodkowy])
     {
         elem_pierwszy = elem_srodkowy + 1;
     }
         
     else
         (wektor[elem_srodkowy] == elem_szukany);
     {
         printf("Szukana wartosc\t %d \tznajduje sie pod indeksem nr: %d.\n", elem_szukany, (elem_srodkowy + 1));
         break;
     }
if (elem_pierwszy > elem_ostatni)
    {
        printf("NIE ZNALAZLEM :-( %d nie ma go na liscie.\n", elem_szukany);
    }
 }

  return 0;
}