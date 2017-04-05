# Wierzcholki

https://cloud.sagemath.com/projects/2ec581e9-e850-483f-b57b-47ac889bd121/files/wierzcholki.sagews

Funkcja przeprowadzająca obliczenia - solvelinear()

Funkcja obsługuje równania z współczynnikami będącymi liczbami całkowitymi.

Należy najpierw wpisać liczbę równań liniowych opisujących problem.

Następnie należy wpisać funkcję celu (max) jako wektor poziomy zawierający wszystkie zmienne występujące w problemie. Dla przykładu załóżmy, że mamy zmienne x1,x2,x3, i chcemy zmaksymalizować funkcję 3*x1+x2. Nalezy wpisac [3,1,0]. Jeżeli łączna liczba zmniennych jest większa od 1, można pominąć nawiasy kwadratowe.

Wpisując wiersze macierzy nalezy postępować j.w.

Wyrazy wolne należy wpisywać kolejno, po jednym dla każdego wiersza macierzy.

Określając warunek min/max, funkcja rozróżnia pomiędzy nierównościami <,>. Np. gdy mamy zmienne x1,x2,x3 i warunek -x1+x2<=3, należy wybrać warunek 'max'.

Funkcja zwraca dwie zmienne - wektor bazowy, dopuszczalny, optymalny oraz numeryczną wartość funkcji celu dla tego wektora.
