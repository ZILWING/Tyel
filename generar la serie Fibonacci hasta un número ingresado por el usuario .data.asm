# Programa para generar la serie Fibonacci hasta un n�mero ingresado por el usuario
.data
prompt: .asciiz "Ingrese un n�mero para la serie Fibonacci: "
result: .asciiz "La serie Fibonacci hasta el n�mero ingresado es: "

.text
.globl main

main:
    # Pedir al usuario que ingrese un n�mero para la serie Fibonacci
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el n�mero ingresado en $t0 (n�mero hasta el cual se generar� la serie Fibonacci)

    # Inicializar los primeros dos n�meros de la serie Fibonacci
    li $t1, 0 # Primer n�mero de la serie (F(0))
    li $t2, 1 # Segundo n�mero de la serie (F(1))

    # Mostrar el encabezado de la serie Fibonacci
    li $v0, 4
    la $a0, result
    syscall

    # Mostrar el primer n�mero de la serie (F(0))
    move $a0, $t1
    li $v0, 1
    syscall

    # Mostrar el segundo n�mero de la serie (F(1))
    move $a0, $t2
    li $v0, 1
    syscall

    # Generar la serie Fibonacci hasta el n�mero ingresado por el usuario
    li $t3, 2 # Iniciar en el tercer n�mero de la serie (F(2))
loop:
    # Calcular el siguiente n�mero de la serie Fibonacci (F(n) = F(n-1) + F(n-2))
    add $t3, $t3, 1 # Incrementar el �ndice de la serie (n)
    add $t4, $t1, $t2 # Sumar los dos �ltimos n�meros para obtener el siguiente n�mero de la serie

    # Mostrar el siguiente n�mero de la serie
    move $a0, $t4
    li $v0, 1
    syscall

    # Actualizar los n�meros de la serie para el siguiente c�lculo
    move $t1, $t2 # El n�mero anterior F(n-1) se convierte en el n�mero anterior F(n-2)
    move $t2, $t4 # El n�mero calculado se convierte en el �ltimo n�mero calculado F(n-1)

    # Comprobar si se alcanz� el n�mero ingresado por el usuario
    ble $t3, $t0, loop # Si el �ndice es menor o igual al n�mero ingresado, continuar generando la serie

    # Salir del programa
    li $v0, 10
    syscall
