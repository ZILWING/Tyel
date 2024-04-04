# Programa para encontrar el n�mero mayor entre al menos tres n�meros ingresados por el usuario

.data
prompt: .asciiz "Ingrese un n�mero: "
result: .asciiz "El n�mero mayor es: "

.text
.globl main

main:
    # Configurar el registro $v0 para la entrada del usuario
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el primer n�mero en $t0

    # Configurar el registro $v0 para la entrada del segundo n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el segundo n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t1, $v0 # Guardar el segundo n�mero en $t1

    # Comparar el primer y segundo n�mero para encontrar el m�ximo hasta ahora
    ble $t0, $t1, check_third_number

    move $t2, $t0 # Si $t0 > $t1, entonces $t0 es el m�ximo
    b end

check_third_number:
    # Configurar el registro $v0 para la entrada del tercer n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el tercer n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0 # Guardar el tercer n�mero en $t2

end:
    # Mostrar el resultado al usuario
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2 # Cargar el n�mero mayor en $a0 para mostrarlo
    syscall

    # Salir del programa
    li $v0, 10
    syscall
