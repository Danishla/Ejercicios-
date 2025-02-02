 % Calcular π usando la serie
calcular_pi(N, Resultado) :-
    calcular_suma_pi(N, 1, 0, Resultado).

% Función auxiliar para la suma
calcular_suma_pi(0, _, Suma, Resultado) :-
    Resultado is 4 * Suma.
calcular_suma_pi(N, K, Suma, Resultado) :-
    Term is (-1) ** (K + 1) / (2 * K - 1),
    NuevoSuma is Suma + Term,
    NuevoK is K + 1,
    NuevoN is N - 1,
    calcular_suma_pi(NuevoN, NuevoK, NuevoSuma, Resultado)

  
    % Generar la sucesión de Fibonacci hasta N
fibonacci(N, Lista) :-
    fibonacci(0, 1, N, [0], Lista).

fibonacci(_, _, 0, Lista, Lista).
fibonacci(A, B, N, Acc, Lista) :-
    N1 is N - 1,
    C is A + B,
    append(Acc, [C], NuevoAcc),
    fibonacci(B, C, N1, NuevoAcc, Lista).

% Ejemplo de uso
calcula_fibonacci :-
    write('Introduce el valor de N: '),
    read(N),
    fibonacci(N, Lista),
    write('Sucesión de Fibonacci: '), write(Lista), nl.
    
% Generar lista de cuadrados y cubos
cuadrados_y_cubos(L) :-
    findall(X, (between(1, 100, N), (N mod 2 =:= 0 -> X is N * N ; X is N * N * N)), L).

% Calcular la suma más cercana a un millón
suma_cercana(Lista, MaxSuma) :-
    suma_parcial(Lista, 0, MaxSuma).

suma_parcial([], Suma, Suma).
suma_parcial([H|T], SumaActual, MaxSuma) :-
    NuevaSuma is SumaActual + H,
    (NuevaSuma >= 1000000 -> MaxSuma = SumaActual ; suma_parcial(T, NuevaSuma, MaxSuma)).

% Ejemplo de uso
calcula_suma :-
    cuadrados_y_cubos(L),
    suma_cercana(L, MaxSuma),
    write('Suma más cercana a un millón: '), write(MaxSuma), nl.
[2/2 13:31] Dany: % Desglosar cantidad en billetes y monedas
desglose(Cantidad, Desglose) :-
    billetes([500, 200, 100, 50, 20, 10, 5, 2, 1]),
    desglosar(Cantidad, [], Desglose).

% Lista de billetes y monedas
billetes([500, 200, 100, 50, 20, 10, 5, 2, 1]).

% Función auxiliar para desglosar
desglosar(0, Acc, Acc).
desglosar(Cantidad, Acc, Desglose) :-
    billetes([B|Bs]),
    (Cantidad >= B -> NuevoCantidad is Cantidad - B, append(Acc, [B], NuevoAcc) ; NuevoCantidad = Cantidad, NuevoAcc = Acc),
    desglosar(NuevoCantidad, NuevoAcc, Desglose).

% Ejemplo de uso
calcula_desglose :-
    write('Introduce la cantidad en euros: '),
    read(Cantidad),
    desglose(Cantidad, Desglose),
    write('Desglose en billetes y monedas: '), write(Desglose), nl.
