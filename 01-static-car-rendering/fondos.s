 .section .text
 .include "colores.s"
 .globl _fondo
 _fondo:
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

     mov x5, #0

 loop:
     // Configura las coordenadas del rectángulo
     ldr x0, =Verde_pasto_1        // Cargo el color
     mov x1, #0                    // Coordenada X del extremo inferior izquierdo
     mov x2, x5                    // Coordenada Y del extremo inferior izquierdo
     mov x3, #639                  // Coordenada X del extremo superior derecho
     mov x4, x5                    // Coordenada Y del extremo superior derecho
     bl Pinta_rectangulo

     // Configura las coordenadas del rectángulo siguiente con el otro color
     ldr x0, =Verde_pasto_2        // Cargar la dirección de Verde_pasto_2 (valor incluido en colores.s)
     mov x1, #0                    // Coordenada X del extremo inferior izquierdo
     add x2, x5, #1                // Coordenada Y del extremo inferior izquierdo (línea siguiente)
     mov x3, #639                  // Coordenada X del extremo superior derecho
     add x4, x5, #1                // Coordenada Y del extremo superior derecho (línea siguiente)

     bl Pinta_rectangulo

     add x5, x5, #2                // Incrementar el contador de línea en 2 para la siguiente línea

     cmp x5, #479                  // Comparar con el número total de líneas (480 líneas)
     b.lt loop                     // Volver a pintar otra línea si no se ha alcanzado el final

// LINEAS BLANCAS Y ROJAS

    mov x5, #140          
    mov x6, #0            
    mov x7, #500          
    mov x8, #50           

    ldr x0, =Linea_blanca_costado_1 

lineas_loop:

    mov x1, x5
    mov x2, x6
    mov x3, x7
    mov x4, x8

    bl Pinta_rectangulo

    // Incrementa las coordenadas 
    add x6, x6, #50        // Y inferior
    add x8, x8, #50        // Y superior

    // Alternar colores
    ldr x10, =Linea_blanca_costado_1
    ldr x11, =Linea_roja_costado_1
    cmp x0, x10            // Compara x0 con el color blanco
    b.eq cambiar_a_roja    // Si es blanca, cambia a rojo

cambiar_a_blanca:
    ldr x0, =Linea_blanca_costado_1
    b continuar

cambiar_a_roja:
    ldr x0, =Linea_roja_costado_1

continuar:
    cmp x6, #500           
    b.lt lineas_loop      


//Ruta base
    ldr x0, =Gris_ruta_1
    mov x1, #152
    mov x2, #479
    mov x3, #488
    mov x4, #0
    bl Pinta_rectangulo
    
    //Primera linea de la calle
    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #100
    mov x3, #269
    mov x4, #16
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #224
    mov x3, #269
    mov x4, #140
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #348
    mov x3, #269
    mov x4, #264
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #472
    mov x3, #269
    mov x4, #388
    bl Pinta_rectangulo

    //Segunda línea de la calle
    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #100
    mov x3, #381
    mov x4, #16
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #224
    mov x3, #381
    mov x4, #140
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #348
    mov x3, #381
    mov x4, #264
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #472
    mov x3, #381
    mov x4, #388
    bl Pinta_rectangulo

    // Restauración del estado del registro
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

