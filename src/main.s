/**************************************************************************************************
* Titulo: main
* Autor: Marcel Andre Velasquez Guzman 15534
* Autor: Josue Jacobs 15041
* Fecha: 8/Octube/2016
* Descripcion: programa principal
***************************************************************************************************/

.text
.balign 4
.global main

main:
	bl getScreenAddr
    ldr r1,=pixelAddr
	str r0,[r1]

	bl getXValue
    ldr r1, =screenResX
    str r0, [r1]

    bl getYValue
    ldr r1, =screenResY
    str r0, [r1]

	b animacion

	/*ldr r1, =x
	ldr r1, [r1]

	ldr r2, =y
	ldr r2, [r2]

	ldr r4, =cartmanWidth
	ldr r4, [r4]

	ldr r5, =cartmanHeight
	ldr r5, [r5]

	ldr r6, =cartman

	mov r7, r4

	bl printImage

	ldr r0, =pixelAddr
	ldr r0, [r0]

	mov r1, #200
	mov r2, #200

	ldr r4, =carro2Width
	ldr r4, [r4]

	ldr r5, =carro2Height
	ldr r5, [r5]

	ldr r6, =carro2

	mov r7, #255

	bl printImage*/

	mov r7,#1
    swi 0


/*printImage:
	push {lr}

	mov r8, r1
	add r4, r1
	add r5, r2

	x .req r1
	y .req r2
	color .req r3

	xFinal .req r4
	yFinal .req r5
	imgDir .req r6
	noColor .req r7
	xIni .req r8


	loopX:
		cmp x, xfinal
		bge loopY

		ldr color, [imgDir], #4

		cmp color, noColor
		bne graficar
		b noGraficar

		graficar:
			push {r0-r8}
			bl pixel
			pop {r0-r8}

		noGraficar:
		add x,#1

		b loopX

	loopY:
		cmp y, yFinal
		bge endImg

		mov x, xIni

		add y, #1

		b loopX

	endImg:

	.unreq x
	.unreq y
	.unreq color

	.unreq imgDir
	.unreq xIni
	.unreq xFinal
	.unreq yFinal

	pop {pc}*/






.data
.balign 4

.global pixelAddr
pixelAddr: .word 0

formatI: .asciz "%d"
mensaje: .asciz "hola"
