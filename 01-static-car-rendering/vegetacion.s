.section .text
.include "colores.s"

.globl Dibuja_arbol

Dibuja_arbol:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

    // TRONCO
        ldr x0, =Tronco_claro          // Cargar la dirección de Tronco_claro (valor incluido en colores.s)
        mov x1, x5             // Coordenada X del extremo inferior izquierdo
        mov x2, x6            // Coordenada Y del extremo inferior izquierdo
        mov x3, x7           // Coordenada X del extremo superior derecho
        mov x4, x8          // Coordenada Y del extremo superior derecho

    bl Pinta_rectangulo
    // COPA
        ldr x0,=Verde_arbol_claro
		mov x1, x9  // X
		mov x2, x10  // Y
		mov x3, x11 // Radio

	bl Pinta_circulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


.globl Dibuja_arboles

Dibuja_arboles:

    mov x5, 68     // X EXT. IZQ
    mov x6, 100    // Y EXT. IZQ
    mov x7, 73     // X EXT. DER
    mov x8, 110    // Y EXT. DER

    mov x9, 70  // X
	mov x10, 80  // Y
	mov x11, 20 // Radio

    bl Dibuja_arbol

    add x5, x5, 30
    add x6, x6, 200
    add x7, x7, 30
    add x8, x8, 200

    add x9, x9, 30
    add x10, x10, 200

    bl Dibuja_arbol

    sub x5, x5, 60
    add x6, x6, 150
    sub x7, x7, 60
    add x8, x8, 150

    sub x9, x9, 60
    add x10, x10, 150

    bl Dibuja_arbol

    mov x5, 568     // X EXT. IZQ
    mov x6, 125    // Y EXT. IZQ
    mov x7, 573     // X EXT. DER
    mov x8, 135    // Y EXT. DER

    mov x9, 570  // X
	mov x10, 105  // Y

    bl Dibuja_arbol

    mov x5, 538     // X EXT. IZQ
    mov x6, 375    // Y EXT. IZQ
    mov x7, 543     // X EXT. DER
    mov x8, 385    // Y EXT. DER

    mov x9, 540  // X
	mov x10, 355  // Y

    bl Dibuja_arbol


    ret

    /* // ARBUSTOS
        ldr x0,=Verde_arbol_claro
		mov x1, 570  // X
		mov x2, 200  // Y
		mov x3, 10
	bl Pinta_circulo */

