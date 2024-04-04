# Programa para encontrar el número mayor entre al menos tres números ingresados por el usuario

.data
prompt: .asciiz "Ingrese un número: "
result: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Configurar el registro $v0 para la entrada del usuario
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0 # Guardar el primer número en $t0

    # Configurar el registro $v0 para la entrada del segundo número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el segundo número ingresado por el usuario
    li $v0, 5
    syscall
    move $t1, $v0 # Guardar el segundo número en $t1

    # Comparar el primer y segundo número para encontrar el máximo hasta ahora
    ble $t0, $t1, check_third_number

    move $t2, $t0 # Si $t0 > $t1, entonces $t0 es el máximo
    b end

check_third_number:
    # Configurar el registro $v0 para la entrada del tercer número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el tercer número ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0 # Guardar el tercer número en $t2

end:
    # Mostrar el resultado al usuario
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t2 # Cargar el número mayor en $a0 para mostrarlo
    syscall

    # Salir del programa
    li $v0, 10
    syscall
