# Programa para encontrar el n�mero menor entre tres n�meros ingresados por el usuario

.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result: .asciiz "El n�mero menor es: "

.text
.globl main

main:
    # Pedir al usuario que ingrese el primer n�mero
    li $v0, 4
    la $a0, prompt1
    syscall

    # Leer el primer n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el primer n�mero en $t0

    # Pedir al usuario que ingrese el segundo n�mero
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer el segundo n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t1, $v0 # Guardar el segundo n�mero en $t1

    # Pedir al usuario que ingrese el tercer n�mero
    li $v0, 4
    la $a0, prompt3
    syscall

    # Leer el tercer n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0 # Guardar el tercer n�mero en $t2

    # Comparar los tres n�meros para encontrar el m�nimo
    move $t3, $t0 # Asignar $t0 como el m�nimo inicialmente

    # Comparar $t1 con el m�nimo actual
    blt $t1, $t3, update_min_t1

    # Comparar $t2 con el m�nimo actual
    blt $t2, $t3, update_min_t2

    j print_result # Saltar a la impresi�n del resultado

update_min_t1:
    move $t3, $t1 # Actualizar el m�nimo con $t1
    j print_result # Saltar a la impresi�n del resultado

update_min_t2:
    move $t3, $t2 # Actualizar el m�nimo con $t2

print_result:
    # Mostrar el resultado al usuario
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t3 # Cargar el n�mero menor en $a0 para mostrarlo
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
