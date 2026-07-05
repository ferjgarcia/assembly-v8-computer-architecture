.section .text
.include "colores.s"
.global Car_animation

.equ DELAY_AUTO, 100000000  //retraso 0.1 s (en nanosegundos)

Car_animation:
    str x0, [sp, -8]!
    str x1, [sp, -8]!
    str x2, [sp, -8]!
    str x3, [sp, -8]!
    str x4, [sp, -8]!
    str x10, [sp, -8]!
    str x11, [sp, -8]!
    str x12, [sp, -8]!
    str x13, [sp, -8]!
    str x14, [sp, -8]!
    str x23, [sp, -8]!
    str x24, [sp, -8]!
    str x25, [sp, -8]!
    str x30, [sp, -8]!

    // CONTADOR
    mov w15, #0

// inicializo el rectangulo
    mov x1, #270 //X
    mov x2, #630//Y
    mov x3, #365//X
    mov x4, #820//Y
    
draw_loop:
    // veces que se ejecuta el bucle hasta que el auto salga de la pantalla
    cmp w15, #80
    bge draw_loop_end

    str x0, [sp, -8]!
    ldr x0, =Gris_ruta_1
    bl Pinta_rectangulo 
    ldr x0, [sp], 8
    mov x12, x14
    bl _auto

    bl _auto
    // Incrementa la coordenada y
    add x11, x11, #10
    sub x2, x2, #10      
    sub x4, x4, #10

    add w15, w15, #1

    // Espera un breve momento antes de dibujar el siguiente auto

    ldr x13,=DELAY_AUTO
    bl Wait
    // Vuelve al inicio del bucle
    b draw_loop

draw_loop_end:

    ldr x30, [sp], 8
    ldr x25, [sp], 8
    ldr x24, [sp], 8
    ldr x23, [sp], 8
    ldr x14, [sp], 8
    ldr x13, [sp], 8
    ldr x12, [sp], 8
    ldr x11, [sp], 8
    ldr x10, [sp], 8
    ldr x4, [sp], 8
    ldr x3, [sp], 8
    ldr x2, [sp], 8
    ldr x1, [sp], 8
    ldr x0, [sp], 8

    ret

.globl Wait

Wait:
    str x0,[sp,-8]!
    str x13,[sp,-8]!
    // Espera el tiempo especificado en x11 (en ciclos de reloj)
    mov x0, x13  // Carga el tiempo de espera en ciclos de reloj
wait_loop:
    subs x0, x0, #1  // Decrementa el contador de tiempo
    bne wait_loop    // Salta de nuevo al bucle si el contador no ha llegado a cero

    ldr x0,[sp],8
    ldr x13,[sp],8

    ret              // Retorna cuando el tiempo de espera ha transcurrido

