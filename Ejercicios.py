import math

def temperatura(ts, t0, k, t):
    return ts + (t0 - ts) * math.exp(-k * t)

# Datos iniciales
ts = 40  # Temperatura ambiente en ºC
t0 = 5   # Temperatura inicial del cuerpo en ºC
k = 0.45 # Constante de enfriamiento

# Calcular las temperaturas después de 1, 5, 12, y 14 horas
tiempos = [1, 5, 12, 14]
temperaturas = [temperatura(ts, t0, k, t) for t in tiempos]

for t, temp in zip(tiempos, temperaturas):
    print(f"Temperatura después de {t} horas: {temp:.2f} ºC")

#calcular el tiempo necesario para que el cuerpo este a 0.5 grados menos q la temperatura ambiente

def tiempo_para_temperatura(ts, t0, k, t_final):
    return -math.log((t_final - ts) / (t0 - ts)) / k

# Temperatura objetivo (0.5ºC menos que la temperatura ambiente)
t_objetivo = ts - 0.5

# Calcular el tiempo necesario
t_necesario = tiempo_para_temperatura(ts, t0, k, t_objetivo)
print(f"Tiempo necesario para que la temperatura sea {t_objetivo} ºC: {t_necesario:.2f} horas")

# Calcular letra del DNI
def calcular_letra_dni(dni):
    letras = "TRWAGMYFPDXBNJZSQVHLCKE"
    return letras[dni % 23]

dni = int(input("Ingrese su número de DNI: "))
letra = calcular_letra_dni(dni)
print(f"La letra correspondiente a su DNI es: {letra}")

# Calcular π
def calcular_pi(n):
    pi = 0
    for k in range(n):
        pi += ((-1) ** k) / (2 * k + 1)
    return 4 * pi

n = 200
pi_valor = calcular_pi(n)
print(f"El valor de π calculado con n={n} es: {pi_valor}")

# Fibonacci 
def fibonacci(n):
    secuencia = [0, 1]
    for i in range(2, n):
        secuencia.append(secuencia[-1] + secuencia[-2])
    return secuencia[:n]

n = int(input("Ingrese el valor de n para la sucesión de Fibonacci: "))
secuencia_fibonacci = fibonacci(n)
print(f"La sucesión de Fibonacci para n={n} es: {secuencia_fibonacci}")


# Lista
def generar_lista():
    lista = []
    for i in range(1, 101):
        if i % 2 == 0:
            lista.append(i ** 2)
        else:
            lista.append(i ** 3)
    return lista

def suma_cercana_a_un_millon(lista):
    suma = 0
    contador = 0
    for numero in lista:
        if suma + numero < 1000000:
            suma += numero
            contador += 1
        else:
            break
    return contador, suma

lista = generar_lista()
contador, suma = suma_cercana_a_un_millon(lista)
print(f"Se deben sumar {contador} números para obtener una suma de {suma}, lo más cercano posible pero inferior a un millón")

# Desglosar bulletes y monedas
def desglose_dinero(cantidad):
    billetes_monedas = [500, 200, 100, 50, 20, 10, 5, 2, 1]
    desglose = {}
    for billete_moneda in billetes_monedas:
        if cantidad >= billete_moneda:
            desglose[billete_moneda], cantidad = divmod(cantidad, billete_moneda)
    return desglose

cantidad = int(input("Ingrese una cantidad entera de euros: "))
desglose = desglose_dinero(cantidad)
print("Desglose en billetes y monedas:")
for billete_moneda, cantidad in desglose.items():
    print(f"{billete_moneda}€: {cantidad}")
