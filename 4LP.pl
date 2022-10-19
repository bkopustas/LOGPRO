/* Benas Kopûstas 4 kursas, 2 grupë */

/*
4.
Domino kauliukø dëstymas.
Duotas domino kauliukø sàraðas. Nustatykite, kaip galima sudëti juos á uþdarà grandinæ.
*/

domino(Listas) :- domino_seka(Listas,Rezultatas) , ar_uzdaras(Rezultatas), !, braizyti(Rezultatas), !.


domino_seka(Listas, Rezultatas) :- domino_seka(Listas, _, Rezultatas).

domino_seka([], _, []) :- !.
domino_seka(Seka, X, [X-Y | Rez]) :-
    select(Kauliukas, Seka, Likutis),
    ar_tinka(Kauliukas, X-Y),
    domino_seka(Likutis, Y, Rez).

ar_tinka(X-Y, X-Y).
ar_tinka(X-Y, Y-X).

ar_uzdaras([X1-_|Likutis]) :- last(Likutis, _-Yn), X1==Yn.


braizyti([]).
braizyti([X|List]) :-
    write(X),nl,
    braizyti(List).
