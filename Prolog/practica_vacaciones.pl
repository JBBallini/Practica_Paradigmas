
%LUGARES%
lugar(iguazu, cataratas).
lugar(marDelPlata, playa).
lugar(marDelPlata, alfajores).
lugar(mendoza, vinos).
lugar(mendoza, cerros).
lugar(salta, tren).
lugar(salta, sierras).
lugar(salta, cerros).
lugar(tierraDelFuego, nieve).
lugar(neuquen, lagoNahuel).
lugar(santaCruz, glaciarPeritoMoreno).
lugar(santaCruz, nieve).

%DISTANCIA%
distancia(marDelPlata, 400).
distancia(iguazu, 1500).
distancia(mendoza, 700).
distancia(neuquen, 350).
distancia(salta, 600).
distancia(santaCruz, 200).
distancia(tierraDelFuego, 900).

%GUSTOS%
leGusta(juan, sierra).
leGusta(ana, playa).
leGusta(ana, cataratas).
leGusta(roberto, nieve).
leGusta(roberto, glaciar).
leGusta(maria, vinos).
leGusta(maria, cerros).
leGusta(sofi, tren).
leGusta(sofi, lagoNahuel).
leGusta(lucas, alfajores).

%VACACIONES%
tieneVacaciones(ana).
tieneVacaciones(roberto).
tieneVacaciones(maria).
tieneVacaciones(sofi).

%OCUPACION%
trabajo(ana, doctor, 5000).
trabajo(juan, ingeniero, 8000).
trabajo(roberto, programador, 4500).
trabajo(maria, arquitecto, 7000).
trabajo(sofi, gerente, 9000).
trabajo(lucas, trabajadorPublico, 3000).

puedeViajar(A, B) :-
    tieneVacaciones(A),
    trabajo(A, _, D),
    D > 4000,
    lugar(B, E),
    leGusta(A, E).

puedeViajar(A, B) :-
    tieneVacaciones(A),
    trabajo(A, _, D),
    D > 4000,
    distancia(B, E),
    E < 500.
    
        
