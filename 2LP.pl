/* Benas Kopûstas, 4 kursas, 2 grupë */
/* 1.3; 6.1 */

/*kelias(Miestas1, Miestas2, Atstumas)*/

kelias(birzai, panevezys, 90).
kelias(birzai, kupiskis, 35).
kelias(birzai, rokiskis, 70).
kelias(rokiskis, kupiskis, 50).
kelias(rokiskis, utena, 60).
kelias(kupiskis, panevezys, 50).
kelias(kupiskis, utena, 40).
kelias(utena, ukmerge, 60).
kelias(utena, moletai, 50).
kelias(panevezys, ukmerge, 60).
kelias(panevezys, kaunas, 100).
kelias(ukmerge, vilnius, 70).
kelias(ukmerge, kaunas, 70).
kelias(moletai, ukmerge, 80).
kelias(moletai, vilnius, 60).
kelias(kaunas, vilnius, 110).
kelias(zarasai, utena, 70).

/*--------------------------------------------*/

/*1.3 Galima nuvaşiuoti iğ miesto X á miestà Y, nevaşiuojant per miestà M*/
/*nvzM = negalima vaziuoti per miesta M*/
nvzM(MiestasX, MiestasY, MiestasM):-
    kelias(MiestasX, MiestasY, _),
    MiestasX \= MiestasM,
    MiestasY \= MiestasM.

nvzM(MiestasX, MiestasY, MiestasM):-
    kelias(MiestasX, Miestas, _),
    nvzM(Miestas, MiestasY, MiestasM),
    MiestasX \= MiestasM,
    MiestasY \= MiestasM.

/*
 * nvzM(zarasai, vilnius, utena). - false
 * nvzM(birzai, vilnius, panevezys). - true
 * nvzM(kupiskis, vilnius, ukmerge). - true
 */

/*--------------------------------------------*/

/*6.1 Dviejø skaièiø suma lygi treèiajam skaièiui*/

nat(nul).
nat(s(X)) :- nat(X).

sumaLygiTreciam(nul, Antras, Antras):- nat(Antras).
sumaLygiTreciam(s(Pirmas), Antras, Trecias):- nat(Pirmas), nat(Antras),sumaLygiTreciam(Pirmas, s(Antras), Trecias),  nat(Trecias).

/*
 * sumaLygiTreciam(s(nul), s(s(nul)), s(s(s(nul)))). - true
 * sumaLygiTreciam(s(nul), s(s(s(nul))), s(s(s(nul)))). - false
 * sumaLygiTreciam(s(s(nul)), s(s(nul)), s(s(s(s(nul))))). - true
 */
