Spy Union
Idea programu polegala na przyjrzeniu sie kazdemu wierzcholkowi j i napisanie
poprzez wprowadzenie binarnych zmiennych X_j- 1(j-ty wierzcholek wchodzi do
nowego drzewa) warunku by on sam i wszyscy jego potomkowie �sumowali sie� do
co najmniej tylu, ile wynosi jego etykieta.
Formalnie wypisywanie dzieci zrealizowalismy poprzez przegladanie kazdego
poddrzewa w glab.
Takie warunki napisalismy dla obu drzew (kt�rych swoja droga bez zadnych
modyfikacji mogloby byc n).
Testy na 10 przykladowych problemach daly 100 procentowa zgodnosc co do liczby
os�b, kt�re mozna zwolnic. Nie bylo natomiast zgodnosci co do tego, kt�re
konkretnie osoby zwalniamy. Wynika to najpewniej ze sposobu wypisywania
bezposrednich potomk�w wierzcholka i/lub sposobu przechodzenia kazdego z
poddrzew.
Program mozna latwo rozwinac poprzez dodanie warunk�w na to, kt�re osoby
koniecznie chcemy zwolnic, a kt�re koniecznie w firmie zostawic.