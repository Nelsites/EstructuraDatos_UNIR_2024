###########################################################################
#Autor:      Nelson Enrique Guio                                          #
#Fecha:      1 Abril 2024                                                 #
#Asignatura: Solicitar al usuario 3 números y determinar el mayor de ellos#
###########################################################################
.data
prompt: .asciiz "Ingrese un número: "
result_msg: .asciiz "El número mayor es: "

.text
main:
    # Reservar espacio en la pila para almacenar los números
    li $t0, 0 # Contador de números ingresados
    li $t1, 3 # Número mínimo de números a ingresar
    li $t2, 0 # Número mayor, inicialmente cero

input_loop:
    # Verificar si se han ingresado suficientes números
    bge $t0, $t1, find_max

    # Solicitar al usuario que ingrese un número
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $t3, $v0

    # Comparar el número ingresado con el número mayor actual
    bgt $t3, $t2, update_max

    # Incrementar el contador de números ingresados
    addi $t0, $t0, 1

    j input_loop

update_max:
    # Actualizar el número mayor si el número ingresado es mayor
    move $t2, $t3

    # Incrementar el contador de números ingresados
    addi $t0, $t0, 1

    j input_loop

find_max:
    # Mostrar el número mayor
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Salir del programa
    li $v0, 10
    syscall
