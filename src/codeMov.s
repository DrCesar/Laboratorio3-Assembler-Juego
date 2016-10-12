

.global animacion
animacion:


	bl moveCartman

	/*bl startNewCar

	bl preMovCars

	bl checkFlags*/

	bl delay


	b animacion











.global startNewCar
startNewCar:

	push {lr}

	car .req r0
	line4Car .req r1
	line4CarAddr .req r2
	availCars .req r3
	availCarsAddr .req r4
	cartmanX .req r5
	carPosX .req r6
	carPosXAddr .req r7
	resolutionX .req r8


	ldr resolutionX, =screenResX
	ldr resolutionX, [resolutionX]

	ldr cartmanX, =cartmanWidth
	ldr cartmanX, [cartmanX]

	ldr line4CarAddr, =lineNewCar
	ldr line4Car, [line4CarAddr]

	cmp line4Car, #1
	beq addCarLine1

	cmp line4Car, #2
	beq addCarLine2

	cmp line4Car, #3
	beq addCarLine3



addCarLine1:

	ldr availCarsAddr, =line1CarAva
	ldr availCars, [availCarsAddr]

	cmp availCars, #0
	beq endStartNewCar

	mov car, #1
	push {r1-r4}
	bl checkFlags
	pop {r1,-r4}

	cmp car, #1
	beq checkAvailCar2

	ldr carPosXAddr, =xCar1
	ldr carPosX, [carPosXAddr]

	b endAddCarLine1

	checkAvailCar2:
		mov car, #2
		push {r1-r4}
		bl checkFlags
		pop {r1,-r4}

		cmp car, #1
		beq endStartNewCar

		ldr carPosXAddr, =xCar2
		ldr carPosX, [carPosXAddr]

		b endAddCarLine1


endAddCarLine1:

	sub availCars, #1

	b startCar



addCarLine2:

	ldr availCarsAddr, =line2CarAva
	ldr availCars, [availCarsAddr]

	cmp availCars, #0
	beq endStartNewCar

	mov car, #3
	push {r1-r4}
	bl checkFlags
	pop {r1,-r4}

	cmp car, #1
	beq checkAvailCar4

	ldr carPosXAddr, =xCar3
	ldr carPosX, [carPosXAddr]

	b endAddCarLine2

	checkAvailCar4:
		mov car, #4
		push {r1-r4}
		bl checkFlags
		pop {r1,-r4}

		cmp car, #1
		beq endStartNewCar

		ldr carPosXAddr, =xCar4
		ldr carPosX, [carPosXAddr]

		b endAddCarLine2


endAddCarLine2:

	sub availCars, #1

	b startCar



addCarLine3:

	ldr availCarsAddr, =line3CarAva
	ldr availCars, [availCarsAddr]

	cmp availCars, #0
	beq endStartNewCar

	mov car, #5
	push {r1-r4}
	bl checkFlags
	pop {r1,-r4}

	cmp car, #1
	beq checkAvailCar6

	ldr carPosXAddr, =xCar5
	ldr carPosX, [carPosXAddr]

	b endAddCarLine3

	checkAvailCar6:
		mov car, #6
		push {r1-r4}
		bl checkFlags
		pop {r1,-r4}

		cmp car, #1
		beq endStartNewCar

		ldr carPosXAddr, =xCar6
		ldr carPosX, [carPosXAddr]

		b endAddCarLine3


endAddCarLine3:

	sub availCars, #1

	b startCar


startCar:

	mov carPosX, resolutionX
	add carPosX, cartmanX
	add carPosX, #50

	str carPosX, [carPosXAddr]

	str availCars, [availCarsAddr]

	add line4Car, #1
	cmp line4Car, #4
	subeq line4Car, #3

	str line4Car, [line4CarAddr]


endStartNewCar:

	.unreq car
	.unreq line4Car
	.unreq line4CarAddr
	.unreq availCars
	.unreq availCarsAddr
	.unreq cartmanX
	.unreq carPosX
	.unreq carPosXAddr
	.unreq resolutionX


	pop {pc}


















.global printImage
printImage:
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

	pop {pc}











.global moveCartman
moveCartman:

	push {lr}

	screenAddr .req r0
	catmanX .req r1
	cartmanY .req r2
	width .req r4
	height .req r5
	cartmanAddr .req r6
	noColor .req r7
	cartmanXAddr .req r8


	ldr screenAddr, =pixelAddr
	ldr screenAddr, [screenAddr]

	ldr cartmanXAddr, =xCartman
	ldr catmanX, [cartmanXAddr]

	ldr cartmanY, =yCartman
	ldr cartmanY, [cartmanY]

	ldr width, =cartmanWidth
	ldr width, [width]

	ldr height, =cartmanHeight
	ldr height, [height]

	ldr cartmanAddr, =cartman 					

	mov noColor, #255

	sub cartmanX, #1
	str cartmanX, [cartmanXAddr]



	push {r0-r7}
	bl printImG
	pop {r0-r7}


	.unreq screenAddr
	.unreq cartmanX
	.unreq cartmanY
	.unreq width
	.unreq height
	.unreq cartmanAddr
	.unreq noColor
	.unreq cartmanXAddr


	pop {pc}













.global movCars
movCars:
	push {lr}

	cmp r0, #1
	beq movCar1

	cmp r0, #2
	beq movCar2

	cmp r0, #3
	beq movCar3

	cmp r0, #4
	beq movCar4

	cmp r0, #5
	beq movCar5

	cmp r0, #6
	beq movCar6



movCar1:

	ldr r9, =xCar1
	ldr r1, [r9]

	ldr r2, =yLine1
	ldr r2, [r2]


	b endMovImg


movCar2:

	ldr r9, =xCar2
	ldr r1, [r9]

	ldr r2, =yLine1
	ldr r2, [r2]


	b endMovCar


movCar3:

	ldr r9, =xCar3
	ldr r1, [r9]

	ldr r2, =yLine2
	ldr r2, [r2]


	b endMovCar

movCar4:

	ldr r9, =xCar4
	ldr r1, [r9]

	ldr r2, =yLine2
	ldr r2, [r2]


	b endMovCar


movCar5:

	ldr r9, =xCar5
	ldr r1, [r9]

	ldr r2, =yLine3
	ldr r2, [r2]


	b endMovCar


movCar6:

	ldr r9, =xCar6
	ldr r1, [r9]

	ldr r2, =yLine3
	ldr r2, [r2]


	b endMovCar


endMovCar:
	ldr r4, =carWidth
	ldr r4, [r4]

	ldr r5, =carHeight
	ldr r5, [r5]

	ldr r6, =car 					@hay que modificar al nombre de la imagen del carro

	mov r7, #255


	sub r1, #1
	str r1, [r9]

	ldr r0, =pixelAddr
	ldr r0, [r0]


	push {r0-r7}
	bl printImG
	pop {r0-r7}



	pop {pc}












.global preMovCars
preMovCars:

	push {lr}

	carNum .req r0
	flag .req r1

preMovCar1:

	ldr flag, =bandCar1
	ldr flag, [flag]

	cmp flag, #0
	bne preMovCar2

	mov carNum, #1

	bl movCars

preMovCar2:

	ldr flag, =bandCar2
	ldr flag, [flag]

	cmp flag, #0
	bne preMovCar3

	mov carNum, #2

	bl movCars

preMovCar3:

	ldr flag, =bandCar3
	ldr flag, [flag]

	cmp flag, #0
	bne preMovCar4

	mov carNum, #3

	bl movCars

preMovCar4:

	ldr flag, =bandCar4
	ldr flag, [flag]

	cmp flag, #0
	bne preMovCar5

	mov carNum, #4

	bl movCars

preMovCar5:

	ldr flag, =bandCar5
	ldr flag, [flag]

	cmp flag, #0
	bne preMovCar6

	mov carNum, #5

	bl movCars

preMovCar6:

	ldr flag, =bandCar6
	ldr flag, [flag]

	cmp flag, #0
	bne endPreMov

	mov carNum, #6

	bl movCars

endPreMov:

	.unreq flag
	.unreq carNum

	pop {pc}










.global checkFlags
checkFlags:

	push {lr}


	flag .req r0
	x .req r1
	car .req r2
	limit .req r3
	flagAdder .req r4

	ldr limit, =limitX
	ldr limit, [limit]

	cmp car, #1
	beq checkFlagCar1

	cmp car, #2
	beq checkFlagCar2

	cmp car, #3
	beq checkFlagCar3

	cmp car, #4
	beq checkFlagCar4

	cmp car, #5
	beq checkFlagCar5

	cmp car, #6
	beq checkFlagCar6

	b endCheckFlags

checkFlagCar1:
	ldr x, =xCar1
	ldr flagAddr, =flagCar1

	b checkCarFlag


checkFlagCar2:
	ldr x, =xCar2
	ldr flagAddr, =flagCar2

	b checkCarFlag

checkFlagCar3:
	ldr x, =xCar3
	ldr flagAddr, =flagCar3

	b checkCarFlag


checkFlagCar4:
	ldr x, =xCar4
	ldr flagAddr, =flagCar4

	b checkCarFlag


checkFlagCar5:
	ldr x, =xCar5
	ldr flagAddr, =flagCar5

	b checkCarFlag


checkFlagCar6:
	ldr x, =xCar6
	ldr flagAddr, =flagCar6

	b checkCarFlag





checkCarFlag:

	ldr x, [x]
	ldr flag, [flagAddr]

	cmp x, limit
	ble downFlagCar
	b upFlagCar

downFlagCar:
	mov flag, #0
	str	flag, [flagAddr]

	b endCheckFlags

upFlagCar:
	mov flag, #1
	str flag, [flagAddr]

	b endCheckFlags




endCheckFlags:

	.unreq flag
	.unreq flagAddr
	.unreq limit
	.unreq x

	pop {pc}






.global delay
delay:
	push {lr}

	mov r0, #0x4000000 @ big number


	sleepLoop:
		subs r0,#1
		bne sleepLoop @ loop delay
	

	pop {pc}


wait:
	ldr r0,=10000
	mov r1, #0
	sleep:
		add r1, #1
		cmp r1, r0
		bne sleep
	mov pc, lr






.data
.balign 4

xCartman: .word 600
yCartman: .word 500

yLine1: .word 200
yLine2: .word 400
yLine3: .word 600

xCar1: .word -300
xCar2: .word -300
xCar3: .word -300
xCar4: .word -300
xCar6: .word -300

line1CarAva: .word 2
line2CarAva: .word 2
line3CarAva: .word 2

lineNewCar: .word 1

flagCar1: .word 0
flagCar2: .word 0
flagCar3: .word 0
flagCar4: .word 0
flagCar5: .word 0
flagCar6: .word 0

limitX: .word -300


screenResX: .word 0
screenResY: .word 0


numDelay: .word 0


