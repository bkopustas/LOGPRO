/* Benas Kopûstas, 4 kursas, 2 grupë */
/* 1.10; 2.1; 3.2; 4.3 */

/*
1.10
sum(S,K1,K2) - skaièiø sàraðo S lyginiø elementø suma yra K1, o nelyginiø elementø suma yra K2. Pavyzdþiui:
?- sum([1,4,7,9,2],K1,K2).
K1 = 6, K2 = 17.
*/

lyginis(X):-
    0 is mod(X,2).

sum([], 0, 0).
sum([H|T], K1, K2):- sum(T, X, K2), lyginis(H),!, K1 is X + H.
sum([H|T], K1, K2):- sum(T, K1, X), \+ lyginis(H),!, K2 is X + H.

/*
UÞKLAUSØ PVZ.:
?- sum([1,2,3], K1, K2).
K1 = 2,
K2 = 4.
?- sum([], K1, K2).
K1 = 0,
K2 = 0.
?- sum([1,3,5], K1, K2).
K1 = 0,
K2 = 8.
*/


/*
2.1
nr(S,K,E) - E yra K-asis sàraðo S elementas. Pavyzdþiui:
?- nr([a,b,c,d,e],3,E).
E = c.
*/

nr([E|_] , 1 ,E):-!.
nr([_|T] , N ,E):-
    N > 0, N1 is N-1, nr(T ,N1 ,E).

/*
UÞKLAUSØ PVZ.:
?- nr([],3,E).
false.
?- nr([a,b,c],2,E).
E = b.
?- nr([a,b,c],5,E).
false.
*/


/*
3.2.
bendri(S1,S2,R) - sàraðas R susideda ið bendrø duotøjø sàraðø S1 ir S2 elementø. Pavyzdþiui:
?- bendri([a,b,c,d],[d,b,e],R).
R = [b,d].
*/


bendri([], _, []).
bendri([H|T], S2, [H|S1]):- priklauso_sarasui(H, S2), !, bendri(T, S2, S1).
bendri([_|T], S2, S1):-  bendri(T, S2, S1).

priklauso_sarasui(X, [X|_]).
priklauso_sarasui(X, [_|Tail]) :- priklauso_sarasui(X,Tail).


/*
UÞKLAUSØ PVZ.:
?- bendri([a,b,c,d,e],[d,b,e],R).
R = [b, d, e].
?- bendri([],[d,b,e],R).
R = [].
?- bendri([a,b,c,d,e],[],R).
R = [].
?- bendri([],[],R).
R = [].
*/


/*
4.3
suma(S1,S2,Sum) - S1 ir S2 yra skaièiai vaizduojami skaitmenø sàraðais. Sum - tø skaièiø suma vaizduojama skaitmenø sàraðu. Pavyzdþiui:
?- suma([9,4,6,1,3,4],[2,8],Sum).
Sum = [9,4,6,1,6,2].
*/

suma(S1,S2,Sum):-
    listas_i_skaiciu(S1, R1), listas_i_skaiciu(S2, R2), skaicius_i_lista(R1+R2,Sum).

listas_i_skaiciu(Listas, Rezultatas) :- listas_i_skaiciu(Listas, 0, Rezultatas).

listas_i_skaiciu([H|T], Prefix, Rezultatas) :-
    Prefix1 is Prefix * 10 + H,
    listas_i_skaiciu(T, Prefix1, Rezultatas).

listas_i_skaiciu([], Rezultatas, Rezultatas).



skaicius_i_lista(Num, [Head | []]):- Num < 10, Head is Num, !.

skaicius_i_lista(Num,List):-
    DividedNum is Num // 10,
    skaicius_i_lista(DividedNum, Temp_List),
    LastDigit is (Num mod 10),
    prideti_prie_galo(Temp_List, [LastDigit], List).

prideti_prie_galo([], X, X).
%Pirmas kint - prad. sarasas, antras - pridedama sarasas, trecias - rezultatas.
prideti_prie_galo([H|T1], X, [H|T2]) :- prideti_prie_galo(T1, X, T2).

/*
UÞKLAUSØ PVZ.:
?- suma([8,2],[2,8],Sum).
Sum = [1, 1, 0].
?- suma([],[],Sum).
Sum = [0].
?- suma([],[2,8],Sum).
Sum = [2, 8].
*/









