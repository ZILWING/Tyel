# Programa para encontrar el número menor entre tres números ingresados por el usuario

.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result: .asciiz "El número menor es: "

.text
.globl main

main:
    # Pedir al usuario que ingrese el primer número
    li $v0, 4
    la $a0, prompt1
    syscall

    # Leer el primer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el primer número en $t0

    # Pedir al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer el segundo número ingresado por el usuario
    li $v0, 5
    syscall
    move $t1, $v0 # Guardar el segundo número en $t1

    # Pedir al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall

    # Leer el tercer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0 # Guardar el tercer número en $t2

    # Comparar los tres números para encontrar el mínimo
    move $t3, $t0 # Asignar $t0 como el mínimo inicialmente

    # Comparar $t1 con el mínimo actual
    blt $t1, $t3, update_min_t1

    # Comparar $t2 con el mínimo actual
    blt $t2, $t3, update_min_t2

    j print_result # Saltar a la impresión del resultado

update_min_t1:
    move $t3, $t1 # Actualizar el mínimo con $t1
    j print_result # Saltar a la impresión del resultado

update_min_t2:
    move $t3, $t2 # Actualizar el mínimo con $t2

print_result:
    # Mostrar el resultado al usuario
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t3 # Cargar el número menor en $a0 para mostrarlo
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall
