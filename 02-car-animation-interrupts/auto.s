.section .text
.include "colores.s"
.globl _auto
_auto:

    str x0, [sp, -8]!
    str x1, [sp, -8]!
    str x2, [sp, -8]!
    str x3, [sp, -8]!
    str x4, [sp, -8]!
    str x5, [sp, -8]!
    str x6, [sp, -8]!
    str x7, [sp, -8]!
    str x8, [sp, -8]!
    str x10, [sp, -8]!
    str x11, [sp, -8]!
    str x12, [sp, -8]!
    str x13, [sp, -8]!
    str x14, [sp, -8]!
    str x23, [sp, -8]!
    str x24, [sp, -8]!
    str x25, [sp, -8]!
    str x30, [sp, -8]!
    //RUEDAS

    // Inicializa las coordenadas de la primera rueda
    ldr x0, =Ruedas        // Cargar la dirección de Ruedas (valor incluido en colores.s)
    mov x5,640+ 287            // Coordenada X inicial del extremo inferior izquierdo
    mov x6,480+  215            // Coordenada Y inicial del extremo inferior izquierdo
    mov x7,640+ 353            // Coordenada X inicial del extremo superior derecho
    mov x8,480+ 235            // Coordenada Y inicial del extremo superior derecho

    sub x5, x5, x10 // X
    sub x7, x7, x10 // X
    sub x6, x6, x11 // Y
    sub x8, x8, x11 // y

    mov w9, 0              // Inicializa el contador de ruedas en 0

ruedas_loop:
    // Configura las coordenadas del rectángulo para la rueda
    mov x1, x5
    mov x2, x6
    mov x3, x7
    mov x4, x8

    bl Pinta_rectangulo

    add x6, x6, #45         
    add x8, x8, #45        

    
    add w9, w9, #1

    // Comprueba si ya se han dibujado las 4 ruedas
    cmp w9, #2
    b.lt ruedas_loop       // Si aún no se han dibujado 4 ruedas, repite el bucle

    //LUCES DEL AUTO
    // Inicializar coordenadas del primer triángulo
    ldr x0, =Luz
    mov x1, 640+ 303                  // Coordenada X del vértice superior
    mov x2, 480+ 203                  // Coordenada Y del vértice superior
    mov x3, 640+ 278                  // Coordenada X del primer vértice de la base
    mov x4, 480+ 153                  // Coordenada Y del primer vértice de la base
    mov x5, 640+ 328                  // Coordenada X del segundo vértice de la base
    mov x6, 480+ 153                  // Coordenada Y del segundo vértice de la base
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x5, x5, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // Y
    sub x6, x6, x11 // Y

    bl Pinta_triangulo

    // Inicializar coordenadas del segundo triángulo
    
    mov x1, 640+ 338                  // Coordenada X del vértice superior del triángulo
    mov x2, 480+ 203                  // Coordenada Y del vértice superior del triángulo
    mov x3, 640+ 313                  // Coordenada X del primer vértice de la base del triángulo
    mov x4, 480+ 153                  // Coordenada Y del primer vértice de la base del triángulo
    mov x5, 640+ 363                  // Coordenada X del segundo vértice de la base del triángulo
    mov x6, 480+ 153                  // Coordenada Y del segundo vértice de la base del triángulo
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x5, x5, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // Y
    sub x6, x6, x11 // Y
    bl Pinta_triangulo

    //CUERPO DEL AUTO

    // Configura las coordenadas del auto
    mov x0, x12          // Cargar la dirección de Rojo (valor incluido en colores.s)
    mov x1, 640+ 293            // Coordenada X del extremo inferior izquierdo
    mov x2, 480+ 203            // Coordenada Y del extremo inferior izquierdo
    mov x3, 640+ 348            // Coordenada X del extremo superior derecho
    mov x4, 480+ 290            // Coordenada Y del extremo superior derecho

    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo
    
    mov x0, x12
    mov x1, 640+ 296            
    mov x2, 480+ 200            
    mov x3, 640+ 345            
    mov x4, 480+ 203            

    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    mov x0, x12
    mov x1, 640+ 302            
    mov x2, 480+ 197            
    mov x3, 640+ 339            
    mov x4, 480+ 200           
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    // Luces

    ldr x0, =Luces
    mov x1, 640+ 302            
    mov x2, 480+ 197            
    mov x3, 640+ 312            
    mov x4, 480+ 200           
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    ldr x0, =Luces
    mov x1, 640+ 298            
    mov x2, 480+ 200            
    mov x3, 640+ 302            
    mov x4, 480+ 203           
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    ldr x0, =Luces
    mov x1, 640+ 329            
    mov x2, 480+ 197            
    mov x3, 640+ 339            
    mov x4, 480+ 200           
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    ldr x0, =Luces
    mov x1, 640+ 339            
    mov x2, 480+ 200            
    mov x3, 640+ 343            
    mov x4, 480+ 203           
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    
    bl Pinta_rectangulo

    // Vidrios delanteros

    ldr x0, =Vidrios       // Cargar la dirección de Vidrios (valor incluido en colores.s)
    mov x1, 640+ 302
    mov x2, 480+ 218            
    mov x3, 640+ 339            
    mov x4, 480+ 230            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    ldr x0, =Vidrios       
    mov x1, 640+ 305            
    mov x2, 480+ 215            
    mov x3, 640+ 336            
    mov x4, 480+ 218            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo    

    mov x0, x12       
    mov x1, 640+ 305            
    mov x2, 480+ 229            
    mov x3, 640+ 336            
    mov x4, 480+ 230            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    // Vidrios traseros

    ldr x0, =Vidrios       // Cargar la dirección de Vidrios (valor incluido en colores.s)
    mov x1, 640+ 302            
    mov x2, 480+ 271            
    mov x3, 640+ 339            
    mov x4, 480+ 283            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    ldr x0, =Vidrios       
    mov x1, 640+ 305            
    mov x2, 480+ 283            
    mov x3, 640+ 336            
    mov x4, 480+ 284            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo    

    mov x0, x12       
    mov x1, 640+ 305            
    mov x2, 480+ 270            
    mov x3, 640+ 336            
    mov x4, 480+ 271            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    // Vidrios laterales  

    ldr x0, =Vidrios       
    mov x1, 640+ 302            
    mov x2, 480+ 267            
    mov x3, 640+ 304            
    mov x4, 480+ 234            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    mov x0, x12       
    mov x1, 640+ 302            
    mov x2, 480+ 251            
    mov x3, 640+ 304            
    mov x4, 480+ 250            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    ldr x0, =Vidrios       
    mov x1, 640+ 339            
    mov x2, 480+ 267            
    mov x3, 640+ 337            
    mov x4, 480+ 234            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    mov x0, x12       
    mov x1, 640+ 339            
    mov x2, 480+ 251            
    mov x3, 640+ 337            
    mov x4, 480+ 250            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    // ALERÓN
 
    ldr x0, =Ruedas       // Cargar la dirección de Rojo_Sombra (valor incluido en colores.s)
    mov x1, 640+ 290            
    mov x2, 480+ 290            
    mov x3, 640+ 351            
    mov x4, 480+ 297
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo

    mov x0, x12       
    mov x1, 640+ 290            
    mov x2, 480+ 293            
    mov x3, 640+ 351            
    mov x4, 480+ 299            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y    
    bl Pinta_rectangulo
    
    // Líneas verticales del auto
   
    ldr x0, =Amarillo_sombra       // Cargar la dirección de Amarillo_sombra (valor incluido en colores.s)
    mov x1, 640+ 316            
    mov x2, 480+ 271            
    mov x3, 640+ 325            
    mov x4, 480+ 229            
    // DESPLAZA EL AUTO A UNA POSICION (X, Y)
    sub x1, x1, x10 // X
    sub x3, x3, x10 // X
    sub x2, x2, x11 // Y
    sub x4, x4, x11 // y
    bl Pinta_rectangulo

    ldr x30, [sp], 8
    ldr x25, [sp], 8
    ldr x24, [sp], 8
    ldr x23, [sp], 8
    ldr x14, [sp], 8
    ldr x13, [sp], 8
    ldr x12, [sp], 8
    ldr x11, [sp], 8
    ldr x10, [sp], 8
    ldr x8, [sp], 8
    ldr x7, [sp], 8
    ldr x6, [sp], 8
    ldr x5, [sp], 8
    ldr x4, [sp], 8
    ldr x3, [sp], 8
    ldr x2, [sp], 8
    ldr x1, [sp], 8
    ldr x0, [sp], 8

    ret
    
