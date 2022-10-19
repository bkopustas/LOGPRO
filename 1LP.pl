/*Benas Kopûstas 4 kursas 2 grupë*/
/* Variantai: 13; 25; 31; 35*/

/*asmuo(Vardas, Lytis, Amþius, Pomëgis)*/

asmuo(jonas, vyras, 62, zvejyba).
asmuo(vanda, moteris, 60, mezgimas).

asmuo(petras, vyras, 40, lenktynes).
asmuo(ilona, moteris, 40, piesimas).
asmuo(viktorija, moteris, 21, kompiuteriniai-zaidimai).
asmuo(dominyka, moteris, 22, muzika).
asmuo(lukas, vyras, 20, kompiuteriniai-zaidimai).

asmuo(zygimantas, vyras, 38, sachmatai).
asmuo(emilija, moteris, 37, muzika).
asmuo(matas, vyras, 14, megsta-limonada).
asmuo(egle, moteris, 20, futbolas).

asmuo(paulius, vyras, 35, futbolas).
asmuo(ieva, moteris, 35, knygos).
asmuo(andrius, vyras, 15, megsta-limonada).
asmuo(ruta, moteris, 16, sachmatai).

asmuo(agne, moteris, 36, tenisas).
asmuo(ignas, vyras, 37, masinos).
asmuo(liucija, moteris, 17, futbolas).
asmuo(monika, moteris, 15, knygos).

asmuo(gintare, moteris, 32, mezgimas).
asmuo(haroldas, vyras, 35, masinos).
asmuo(algis, vyras, 14, megsta-limonada).
asmuo(lina, moteris, 13, sachmatai).
asmuo(adomas, vyras, 12, megsta-limonada).

/*mama(Mama, Vaikas)*/

mama(vanda, petras).
mama(vanda, zygimantas).
mama(vanda, paulius).
mama(vanda, agne).
mama(vanda, gintare).

mama(ilona, viktorija).
mama(ilona, dominyka).
mama(ilona, lukas).

mama(emilija, matas).
mama(emilija, egle).

mama(ieva, andrius).
mama(ieva, ruta).

mama(agne, liucija).
mama(agne, monika).

mama(gintare, algis).
mama(gintare, lina).
mama(gintare, adomas).

/*pora(Vyras, Zmona)*/

pora(jonas, vanda).
pora(petras, ilona).
pora(zygimantas, emilija).
pora(paulius, ieva).
pora(ignas, agne).
pora(haroldas, gintare).

vienas_is_tevu(TevasMama, Vaikas):-
    mama(TevasMama, Vaikas).
vienas_is_tevu(TevasMama, Vaikas):-
    pora(TevasMama, Mama),
    mama(Mama, Vaikas).


/*13. dukterecia(Dukterecia, DedeTeta) - Pirmasis asmuo (Dukterecia) yra antrojo (DedeTeta) dukterëèia (brolio ar sesers dukra)*/

dukterecia(Dukterecia, DedeTeta):-
    mama(Mociute, DedeTeta),
    mama(Mociute, TevasMama),
    vienas_is_tevu(TevasMama, Dukterecia),
    asmuo(Dukterecia, moteris, _, _),
    TevasMama \= DedeTeta.

/*
dukterecia(lina, zygimantas). true
dukterecia(lina, gintare). false
dukterecia(lina, agne). true
*/

/*25. pussesere(Pussesere, PusbrolisPussesere) - Pirmasis asmuo (Pussesere) yra antrojo (PusbrolisPussesere) pusseserë*/

pussesere(Pussesere, PusbrolisPussesere):-
    vienas_is_tevu(PusseseresPusbrolioTevasMama, PusbrolisPussesere),
    mama(Mociute, PusseseresPusbrolioTevasMama),
    mama(Mociute, TevasMama),
    vienas_is_tevu(TevasMama, Pussesere),
    asmuo(Pussesere, moteris, _, _),
    TevasMama \= PusseseresPusbrolioTevasMama.

/*
pussesere(monika, liucija). false
pussesere(monika, petras). false
pussesere(monika, matas). true
*/

/*31. vpjz(Vyras) - Asmuo Vyras yra „vyras paèiame jëgø þydëjime“: jo amþius yra ið tam tikro intervalo (nuspræskite patys, kokio)*/

vpjz(Vyras):-
    asmuo(Vyras, vyras, Amzius, _), Amzius >= 18, Amzius =< 50.

/*
vpjz(jonas) false
vpjz(paulius) true
*/


/*35. tmbml(Berniukas1, Berniukas2, Berniukas3) - „Trys maþi berniukai - Berniukas1, Berniukas2 ir Berniukas3 - mëgsta limonadà“ (kas yra „maþi“, nuspræskite patys)*/

tmbml(Berniukas1, Berniukas2, Berniukas3) :-
    asmuo(Berniukas1, vyras, Amzius1, megsta-limonada),
    asmuo(Berniukas2, vyras, Amzius2, megsta-limonada),
    asmuo(Berniukas3, vyras, Amzius3, megsta-limonada),
    Amzius1 >= 8, Amzius2 >= 8, Amzius3 >= 8,
    Amzius1 =< 16, Amzius2 =< 16, Amzius3 =< 16, Berniukas1\=Berniukas2, Berniukas1\=Berniukas3, Berniukas2\=Berniukas3.

/*
tmbml(adomas, algis, matas) true
*/
