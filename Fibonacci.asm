###########################################################################
#Autor:      Nelson Enrique Guio                                          #
#Fecha:      1 Abril 2024                                                 #
#Asignatura: Solicitar al usuario 1 número y generar una serie Fibonacci. #
###########################################################################

.data
prompt: .asciiz "Ingrese el número de términos de la serie Fibonacci: "
result_msg: .asciiz "La serie Fibonacci es: "

.text
main:
    # Solicitar al usuario el número de términos de la serie Fibonacci
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el número ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0   # $t0 almacena el número de términos

    # Preparar los primeros dos términos de la serie Fibonacci
    li $t1, 0       # Primer término
    li $t2, 1       # Segundo término

    # Mostrar mensaje inicial
    li $v0, 4
    la $a0, result_msg
    syscall

    # Mostrar los primeros dos términos de la serie Fibonacci
    loop:
        # Mostrar el término actual
        li $v0, 1
        move $a0, $t1
        syscall

        # Calcular el siguiente término de la serie Fibonacci
        add $t3, $t1, $t2   # $t3 = $t1 + $t2
        move $t1, $t2       # $t1 = $t2
        move $t2, $t3       # $t2 = $t3

        # Decrementar el contador de términos restantes
        addi $t0, $t0, -1

        # Verificar si se han mostrado todos los términos solicitados
        bgtz $t0, loop

    # Salir del programa
    li $v0, 10
    syscall
