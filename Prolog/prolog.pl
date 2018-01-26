/*Napisz funkcję, która działa jak delete.*/
usun(X, [], []).
usun(X, [X|T], Y):-usun(X,T,Y),!.
usun(X, [Y|T], [Y|T2]):-usun(X, T, T2).

/*Napisz procedure tworzącą listę n-elementową zawierającą podwojone liczby całkowite z przedziału <1,n>*/
lista(N,L) :- numlist(1,N,L).
mnozenie([],[]).
mnozenie([H|T],[R|Y]) :- R is 2*H, mnozenie(T,Y).
podwajaj(N, Wynikowa) :- lista(N,L), mnozenie(L,Wynikowa).

/*Sprawdzanie czy jest listą*/
lista([]). 
lista([_|T]) :- lista(T).

/*Sprawdzenie czy element należy do listy:*/
element(X, [X|_]).
element(X, [_|Ogon]) :-  element(X, Ogon).

/*Sprawdzenie czy lista jest początkiem innej:*/
poczatek([],X).
poczatek([H1|T1],[H1|T2]):-poczatek(T1,T2).

/*Znalezienie ostatniego elementu listy:*/
ostatni([H], H).
ostatni([_|T], O) :-ostatni(T, O).

/*Sprawdzenie czy elementy tworzą ciąg rosnący:*/
rosnacy([_]).
rosnacy([G|[H|T]]) :-G < H, rosnacy([H|T]).

/*Znalezienie największej wartości:*/
max([X], X).
max([H|T], X) :-max(T, X1), X1 > H, X is X1.
max([H|T], X) :-max(T, X1), X1 < H, X is H.

/*Znalezienie elementu o podanym numerze:*/
znajdz([X|_],1,X).
znajdz([_|L],K,X) :- znajdz(L,K1,X), K is K1 + 1.

/*Dodanie 2 list (jak append):*/
dodaj([],X,X).
dodaj([X|Y],Z,[X|W]) :- dodaj(Y,Z,W).

/*Usuwanie elementu (jak select):*/
usun(X,[X|T],T). 
usun(X,[H|T],[H|Tnowy]):- usun(X,T,Tnowy).

/*działanie jak length:*/
dlugosc([],0).
dlugosc([G|O],N):-dlugosc(O,N1),N is N1+1.

/*działanie jak reverse:*/
odwracanie([],[]).
odwracanie([A|B],C):-odwracanie(B,D), append(D,[A],C).

/*działanie jak last:*/
ostatni([H], H).
ostatni([_|T], O) :-ostatni(T, O).

/*działanie jak nth1:*/
nty(X,[X|_],1).
nty(X,[_|T],N) :-nty(X,T,N1), N is N1+1.

display(a*b+c*d).
+(*(a,b),*(c,d))
write(a*b+c*d).
a*b+c*d

/*dodawanie macierzy:*/
dodaj(M1, M2, W) :- maplist(maplist(sum), M1, M2, W).
sum(X,Y,Z) :- Z is X+Y.

/*Baza danych*/
gory(pasmo_gorskie, najwyzszy_szczyt, miejscowosc_w_gorach, liczba_schronisk, liczba_turystow_w_roku). 
