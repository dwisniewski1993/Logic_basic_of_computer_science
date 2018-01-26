{-Zdefiniować funkcję obliczającą sumę liczb nieparzystych podzielnych przez 7 z przedziału <1,n>. Podaj typ ten funkcji-}
lista n = [1..n]
sumowanie lista = foldr (+) 0 (filter (\n -> n `rem` 2 == 1) (filter (\n -> n `mod` 7 == 0) lista))
zliczanie n = sumowanie (lista n)
--Typ: zliczanie::Integral b => b -> b

{-Zdefiniować funkcję map oraz podać jej typ-}
--map(^2) [2,4,6,8]
--Typ: map::(a->b)->[a]->[b]

--Rekurencyjne obliczanie silni:
silnia 0 = 1
silnia n = n * silnia (n-1)

--Rekurencyjne obliczanie potęgi:
potega a 0 = 1
potega a n = a * potega a (n-1)
--akumulatorowa:
power a n = foldr (*) 1 $ duplicate (a, n)

--Zwracanie przedostatniego elementu listy:
przedostatni x = drop 1 (take 2 (reverse x))

--Zwracanie drugiego elementu listy:
drugi x = drop 1 (take 2 x)

--Odwrotne ułożenie elementów:
odwroc [] = []
odwroc (h:t) = odwroc t ++ [h]

--Zamiana ostatniego z pierwszym:
przestaw [] = [] 
przestaw [a] = [a] 
przestaw x = last x : (init . tail $ x) ++ [head x]

--Liczba dodatnich elementów listy:
dodatnie x = foldr (+) 0 $ map (^0) (filter (>0) x)

--Parzysta liczba elementów:
czy_parzysty  n = mod (length n) 2 == 0

--Podniesienie do kwadratu wszystkich elementów:
sqrlist [] = []
sqrlist (h:t)= [h^2] ++ sqrlist t

--Ile razy obiekt występuje w liście:
count x [] =0
count x a = length(filter (==x) a)

--Powtarzanie elementu b-razy:
duplicate(a, 0) = []
duplicate(a, b) = a : duplicate(a, (b-1))

--Czy jest palindromem:
palindrom x = x == (reverse x)

--Usunięcie pierwszego wystąpienia elementu:
select _ [] = [] 
select x (h:t) | x == h = t | otherwise = h : select x t

--Usunięcie elementu na n-tym miejscu:
delnth n lista =  select (lista !! n) lista

--Sprawdzenie czy lista jest początkiem innej:
prefix [] ys = True
prefix xs [] = False
prefix (x:xs) (y:ys) = x==y && prefix xs ys

--Suma liczb od 1 do n:
suma n = foldr (+) 0 [1..n]

--Wstawienie do listy l elementu e na pozycję n:
wstaw n e l = lewa ++ (e:prawa) where (lewa,prawa) = splitAt n l

--Lista uzyskana przez usunięcie n-tego elementu:
usun n l = lewa ++ prawa where (lewa, (_:prawa)) = splitAt n l

--Spr czy wszystkie elementy pierwszej listy występują na drugiej liście
zawieranie [] y = True
zawieranie (x:xs) y = elem x y && zawieranie xs y

--Liczba wystąpień elementu e na liście l:
liczbaw(e, []) =0
liczbaw(e, l) = length(filter (==e) l)

--Sprawdzenie równości 2 list:
rowne x y = zawieranie x y && zawieranie y x

--Podniesienie do potęgi z użyciem lambda:
pot a = (\x -> x^2) a
potega [] =[]
potega (h:t) = [pot h] ++ potega t

--Podzielnośc x przez y z użyciem lambda:
podzielnosc x y = (\x -> mod x  y == 0) x
