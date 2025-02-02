% Temperatura en función del tiempo
temperatura(T0, Ts, K, T, Resultado) :-
    Resultado is Ts + (T0 - Ts) * exp(-K * T).

% Ejemplos de cálculo de temperatura
calcula_temperatura :-
    temperatura(5, 40, 0.45, 1, Resultado1),
    temperatura(5, 40, 0.45, 5, Resultado2),
    temperatura(5, 40, 0.45, 12, Resultado3),
    temperatura(5, 40, 0.45, 14, Resultado4),
    write('Temperatura después de 1 hora: '), write(Resultado1), nl,
    write('Temperatura después de 5 horas: '), write(Resultado2), nl,
    write('Temperatura después de 12 horas: '), write(Resultado3), nl,
    write('Temperatura después de 14 horas: '), write(Resultado4), nl.

% Calcular el tiempo necesario para alcanzar una temperatura específica
tiempo_para_temperatura(T0, Ts, K, Temp, Tiempo) :-
    Tiempo is -log((Temp - Ts) / (T0 - Ts)) / K.

% Ejemplo para encontrar el tiempo necesario para alcanzar Ts - 0.5
calcula_tiempo :-
    tiempo_para_temperatura(5, 40, 0.45, 39.5, Tiempo),
    write('Tiempo necesario para alcanzar 39.5 grados: '), write(Tiempo), nl.
