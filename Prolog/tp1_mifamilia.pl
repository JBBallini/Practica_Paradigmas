/*----------------------------------------------------------------------------------------
    TP1: Mi Familia
    ALUMNO: Ballini, Juan Bautista
    MATERIA: Paradigmas de Programación
---------------------------------------------------------------------------------------- */

/*------------------------------------- HECHOS DIRECTOS --------------------------------- */

%Parejas
esta_casado(gerardo, emily).
esta_casado(emily, gerardo).
esta_casado(andres, erica).
esta_casado(erica, andres).
esta_casado(lucas, sofia).
esta_casado(sofia, lucas).

%Padres
es_padre(gerardo, lucas).
es_padre(gerardo, erica).
es_padre(andres, laura).
es_padre(andres, cecilia).
es_padre(andres, marcos).
es_padre(lucas, soledad).
es_padre(lucas, maria).

%Madres
es_madre(emily, lucas).
es_madre(emily, erica).
es_madre(erica, laura).
es_madre(erica, cecilia).
es_madre(erica, marcos).
es_madre(sofia, maria).
es_madre(sofia, soledad).

%Géneros
genero(gerardo, hombre).
genero(emily, mujer).
genero(andres, hombre).
genero(erica, mujer).
genero(sofia, mujer).
genero(lucas, hombre).
genero(laura, mujer).
genero(cecilia, mujer).
genero(marcos, hombre).
genero(soledad, mujer).
genero(maria, mujer).

%Edades
edad(gerardo, 75).
edad(emily, 73).
edad(andres, 36).
edad(erica, 40).
edad(sofia, 32).
edad(lucas, 33).
edad(laura, 15).
edad(cecilia, 12).
edad(marcos, 10).
edad(soledad, 4).
edad(maria, 4).

/*------------------------------------- REGLAS -------------------------------------------- */

%Abuelo
es_abuelo(A, B) :- 
    es_padre(A, C), 
    (es_madre(C, B) ; es_padre(C, B)).

%Abuela
es_abuela(A, B) :-
    es_madre(A, C), 
    (es_madre(C, B) ; es_padre(C, B)).

%Hermano
es_hermano(A, B) :-
    es_padre(C, A),
    es_padre(C, B),
    A \= B,
    genero(A, hombre).

%Hermana
es_hermana(A, B) :-
    es_padre(C, A),
    es_padre(C, B),
    A \= B,
    genero(A, mujer).

%Tío
es_tio(A, B) :-
    (es_hermano(A, C) ; (esta_casado(A, D), es_hermana(D, C))),
    (es_padre(C, B) ; es_madre(C, B)).

%Tía
es_tia(A, B) :-
    (es_hermana(A, C) ; (esta_casado(A, D), es_hermano(D, C))),
    (es_padre(C, B) ; es_madre(C, B)).

%Primo
es_primo(A, B) :-
    (es_tio(C, A) ; es_tia(C, A)),
    (es_padre(C, B) ; es_madre(C, B)),
    genero(A, hombre).

%Prima
es_prima(A, B) :-
    (es_tio(C, A) ; es_tia(C, A)),
    (es_padre(C, B) ; es_madre(C, B)),
    genero(A, mujer).

%Yerno
es_yerno(A, B) :-
    esta_casado(A, C),
    es_padre(B, C),
    genero(A, hombre).

%Nuera
es_nuera(A, B) :-
    esta_casado(A, C),
    es_padre(B, C),
    genero(A, mujer).

%Suegro
es_suegro(A, B) :-
    es_padre(A, C),
    esta_casado(B, C);
    genero(A, hombre).

%Suegra
es_suegra(A, B) :-
    es_madre(A, C),
    esta_casado(B, C);
    genero(A, mujer).

%Hijo mediano
hijo_mediano(A) :-
    (es_hermano(A, B) ; es_hermana(A, B)),
    (es_hermano(A, C) ; es_hermana(A, C)),
    edad(B, D),
    edad(C, E),
    edad(A, F),
    (F > D), 
    (F < E).

%Gemelos
son_gemelos(A, B) :-
    (es_hermano(A, B) ; es_hermana(A, B)),
    edad(A, C),
    edad(B, D),
    C == D.

/* ----------------------------------------------------------------------------------------
    EJEMPLOS DE RESPUESTAS

    16 ?- es_tio(T, S).
    T = lucas,
    S = laura ;
    T = lucas,
    S = cecilia ;
    T = lucas,
    S = marcos ;
    T = andres,
    S = soledad ;
    T = andres,
    S = maria ;
    false.

    17 ?- es_abuela(mirta, cecilia).
    false.
        
    18 ?- es_abuelo(gerardo, cecilia).
    true .

    19 ?- es_hermano(soledad, maria).
    false.
        
    20 ?- es_hermana(soledad, maria). 
    true. 
        
    21 ?- es_yerno(Y, S).
    Y = andres, 
    S = gerardo ;
    false.
        
    22 ?- son_gemelos(soledad, maria).
    true. 
        
    23 ?- hijo_mediano(cecilia).
    true 
---------------------------------------------------------------------------------------- */
    