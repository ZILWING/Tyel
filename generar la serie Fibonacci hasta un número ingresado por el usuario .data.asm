# Programa para generar la serie Fibonacci hasta un número ingresado por el usuario
.data
prompt: .asciiz "Ingrese un número para la serie Fibonacci: "
result: .asciiz "La serie Fibonacci hasta el número ingresado es: "

.text
.globl main

main:
    # Pedir al usuario que ingrese un número para la serie Fibonacci
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el número ingresado en $t0 (número hasta el cual se generará la serie Fibonacci)

    # Inicializar los primeros dos números de la serie Fibonacci
    li $t1, 0 # Primer número de la serie (F(0))
    li $t2, 1 # Segundo número de la serie (F(1))

    # Mostrar el encabezado de la serie Fibonacci
    li $v0, 4
    la $a0, result
    syscall

    # Mostrar el primer número de la serie (F(0))
    move $a0, $t1
    li $v0, 1
    syscall

    # Mostrar el segundo número de la serie (F(1))
    move $a0, $t2
    li $v0, 1
    syscall

    # Generar la serie Fibonacci hasta el número ingresado por el usuario
    li $t3, 2 # Iniciar en el tercer número de la serie (F(2))
loop:
    # Calcular el siguiente número de la serie Fibonacci (F(n) = F(n-1) + F(n-2))
    add $t3, $t3, 1 # Incrementar el índice de la serie (n)
    add $t4, $t1, $t2 # Sumar los dos últimos números para obtener el siguiente número de la serie

    # Mostrar el siguiente número de la serie
    move $a0, $t4
    li $v0, 1
    syscall

    # Actualizar los números de la serie para el siguiente cálculo
    move $t1, $t2 # El número anterior F(n-1) se convierte en el número anterior F(n-2)
    move $t2, $t4 # El número calculado se convierte en el último número calculado F(n-1)

    # Comprobar si se alcanzó el número ingresado por el usuario
    ble $t3, $t0, loop # Si el índice es menor o igual al número ingresado, continuar generando la serie

    # Salir del programa
    li $v0, 10
    syscall
