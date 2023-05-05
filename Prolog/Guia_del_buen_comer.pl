/*----------------------------------------------------------------------------------------
    TP: Guía del Buen Comer
    ALUMNO: Ballini, Juan Bautista
    MATERIA: Paradigmas de Programación
---------------------------------------------------------------------------------------- */

/*------------------------------------- LAS COMIDAS ------------------------------------ */

contiene(manteca, leche).


esLacteo(A) :-
    contiene(A, leche).
tieneGluten(A) :-
    contiene(A, trigo).
derivaAnimal(A) :-
    esAnimal(A,_).

derivaDe(A, B) :-
    contiene(A, B).
derivaDe(A, B) :-
    esAnimal(A, B).
derivaDe(A, C) :-
    contiene(A, B),
    derivaDe(B, C).

/*------------------------------------- LA ALIMENTACIÓN ------------------------------------ */

esVegano(analia).
esCeliaco(benito).
esOmnivora(claudia).

contiene(sandwich, pan).
contiene(sandwich, jamon).
contiene(sandwich, queso).
contiene(queso, leche).
esAnimal(leche, vaca).
contiene(pan, trigo).

contiene(wokVegetales, pan).
contiene(wokVegetales, arroz).
contiene(wokVegetales, zanahorias).
contiene(wokVegetales, cebolla).
contiene(wokVegetales, morron).

comidaVeganaPara(A, B) :-
    esVegano(B),
    forall(derivaDe(A, C), not(esAnimal(_, C))).