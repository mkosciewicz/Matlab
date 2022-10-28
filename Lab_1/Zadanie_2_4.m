n = input("Podaj rozmiar macierzy: ");

A = rand(n)
B = rand(n)

inv(A)
B';
A+B;
A-B;
A*B;
x = input('Wprowadź liczbę przemnożenia macierzy: ');
M = A*x