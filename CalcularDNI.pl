% Tabla de letras según el residuo
letra_dni(0, 'T').
letra_dni(1, 'R').
letra_dni(2, 'W').
letra_dni(3, 'A').
letra_dni(4, 'G').
letra_dni(5, 'M').
letra_dni(6, 'Y').
letra_dni(7, 'F').
letra_dni(8, 'P').
letra_dni(9, 'D').
letra_dni(10, 'X').
letra_dni(11, 'B').
letra_dni(12, 'N').
letra_dni(13, 'J').
letra_dni(14, 'Z').
letra_dni(15, 'S').
letra_dni(16, 'Q').
letra_dni(17, 'V').
letra_dni(18, 'H').
letra_dni(19, 'L').
letra_dni(20, 'C').
letra_dni(21, 'K').
letra_dni(22, 'E').

% Calcular la letra del DNI
calcula_letra_dni(DNI, Letra) :-
    Residuo is DNI mod 23,
    letra_dni(Residuo, Letra).

% Ejemplo de uso
consulta_letra :-
    write('Introduce el número de DNI: '),
    read(DNI),
    calcula_letra_dni(DNI, Letra),
    write('La letra del DNI es: '), write(Letra), nl.
