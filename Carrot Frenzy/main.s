	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r1, #67108864
	mov	r3, #256
	mov	r0, #7296
	ldr	r2, .L4
	push	{r4, lr}
	str	ip, [r2]
	ldr	r4, .L4+4
	strh	r3, [r1]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+36
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	DMANow
	.word	menuPal
	.word	16864
	.word	menuTiles
	.word	100720640
	.word	menuMap
	.word	stopSound
	.word	menuSong_length
	.word	menuSong_data
	.word	playSoundA
	.size	goToMenu, .-goToMenu
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #5888
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L8+12
	ldr	ip, .L8+16
	ldrh	lr, [r2, #48]
	ldr	r0, .L8+20
	ldr	r1, .L8+24
	ldr	r2, .L8+28
	strh	lr, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	hOff
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1.part.0, %function
game1.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L13:
	.align	2
.L12:
	.word	stopSound
	.word	menuSong_length
	.word	menuSong_data
	.word	playSoundA
	.size	game1.part.0, .-game1.part.0
	.set	game3.part.0,game1.part.0
	.set	game2.part.0,game1.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToMenu
.L17:
	.align	2
.L16:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r1, #67108864
	mov	r3, #256
	mov	r0, #7296
	push	{r4, lr}
	ldr	r2, .L20
	ldr	r4, .L20+4
	str	ip, [r2]
	strh	r3, [r1]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #19200
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.word	DMANow
	.word	instructions1Pal
	.word	instructions1Tiles
	.word	100720640
	.word	instructions1Map
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	buttons
	.size	menu, .-menu
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #2
	mov	ip, #0
	mov	r1, #67108864
	mov	r3, #256
	mov	r0, #7296
	ldr	r2, .L31
	str	lr, [r2]
	ldr	r2, .L31+4
	strh	r3, [r1]	@ movhi
	ldr	r4, .L31+8
	str	ip, [r2]
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L31+16
	ldr	r1, .L31+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L31+24
	ldr	r1, .L31+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	state
	.word	seed
	.word	DMANow
	.word	instructions2Pal
	.word	19104
	.word	instructions2Tiles
	.word	100720640
	.word	instructions2Map
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L38
	ldr	r1, .L38+4
	ldr	r3, [r2]
	ldrh	r1, [r1]
	add	r3, r3, #1
	tst	r1, #8
	str	r3, [r2]
	bxeq	lr
	ldr	r3, .L38+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions2
.L39:
	.align	2
.L38:
	.word	seed
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #7168
	mov	r4, #3
	mov	r1, #67108864
	mov	r2, #4352
	ldr	r3, .L42
	ldr	r5, .L42+4
	str	r4, [r3]
	mov	r0, r4
	strh	r2, [r1]	@ movhi
	mov	r3, #256
	strh	ip, [r1, #8]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L42+8
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1280
	mov	r2, #100663296
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L42+16
	ldr	r1, .L42+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	state
	.word	DMANow
	.word	gameBGLevel1Pal
	.word	gameBGLevel1Tiles
	.word	100720640
	.word	gameBGLevel1Map
	.size	goToGame1, .-goToGame1
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L51
	ldr	r4, .L51+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L44
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, lr}
	bx	lr
.L50:
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L51+20
	ldr	r3, .L51+24
	mov	lr, pc
	bx	r3
	bl	goToGame1
	ldr	r3, .L51+28
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L51+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	stopSoundA
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initializeGame
	.word	srand
	.size	instructions2, .-instructions2
	.align	2
	.global	goToTransition1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTransition1, %function
goToTransition1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #4
	mov	r5, #67108864
	mov	r6, #256
	ldr	r2, .L55
	ldr	r3, .L55+4
	str	r1, [r2]
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L55+12
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r3, r6
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L55+20
	ldr	r1, .L55+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L55+28
	ldr	r1, .L55+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	transitionLevel2Pal
	.word	5024
	.word	transitionLevel2Tiles
	.word	100720640
	.word	transitionLevel2Map
	.size	goToTransition1, .-goToTransition1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #5
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7168
	push	{r4, lr}
	ldr	r3, .L59
	ldr	r4, .L59+4
	str	ip, [r3]
	strh	r2, [r1]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L59+8
	mov	lr, pc
	bx	r4
	mov	r3, #1312
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L59+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L59+16
	ldr	r1, .L59+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	state
	.word	DMANow
	.word	gameBGLevel2Pal
	.word	gameBGLevel2Tiles
	.word	100720640
	.word	gameBGLevel2Map
	.size	goToGame2, .-goToGame2
	.align	2
	.global	transition1
	.syntax unified
	.arm
	.fpu softvfp
	.type	transition1, %function
transition1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame2
	mov	r0, #2
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	transition1, .-transition1
	.align	2
	.global	goToTransition2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTransition2, %function
goToTransition2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #6
	mov	r5, #67108864
	mov	r6, #256
	ldr	r2, .L74
	ldr	r3, .L74+4
	str	r1, [r2]
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L74+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+12
	mov	lr, pc
	bx	r4
	mov	r2, #7168
	mov	r3, r6
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L74+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L74+20
	ldr	r1, .L74+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L74+28
	ldr	r1, .L74+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	transitionLevel3Pal
	.word	5008
	.word	transitionLevel3Tiles
	.word	100720640
	.word	transitionLevel3Map
	.size	goToTransition2, .-goToTransition2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #7
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7168
	push	{r4, lr}
	ldr	r3, .L78
	ldr	r4, .L78+4
	str	ip, [r3]
	strh	r2, [r1]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+8
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L78+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L78+16
	ldr	r1, .L78+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	state
	.word	DMANow
	.word	gameBGLevel3Pal
	.word	gameBGLevel3Tiles
	.word	100720640
	.word	gameBGLevel3Map
	.size	goToGame3, .-goToGame3
	.align	2
	.global	transition2
	.syntax unified
	.arm
	.fpu softvfp
	.type	transition2, %function
transition2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L89
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L89+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame3
	mov	r0, #3
	ldr	r3, .L89+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	transition2, .-transition2
	.align	2
	.global	goToPause1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause1, %function
goToPause1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #8
	mov	r5, #67108864
	mov	r2, #1536
	ldr	r1, .L93
	ldr	r3, .L93+4
	str	r0, [r1]
	strh	r2, [r5]	@ movhi
	ldr	r4, .L93+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L93+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L93+16
	ldr	r2, .L93+20
	strh	r3, [r5, #12]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L93+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L93+28
	ldr	r2, .L93+32
	ldr	r1, .L93+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L93+40
	ldr	r1, .L93+44
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r0, #3
	ldr	r2, .L93+48
	ldr	r1, .L93+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L93+56
	ldr	r1, .L93+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	23556
	.word	7944
	.word	pauseBGPal
	.word	5984
	.word	100679680
	.word	pauseBGTiles
	.word	100720640
	.word	pauseBGMap
	.word	100696064
	.word	cloudsTiles
	.word	100726784
	.word	cloudsMap
	.size	goToPause1, .-goToPause1
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L107
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L96
	ldr	r2, .L107+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L105
.L96:
	tst	r3, #4
	beq	.L95
	ldr	r3, .L107+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L106
.L95:
	pop	{r4, lr}
	bx	lr
.L105:
	ldr	r3, .L107+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L107+24
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L107+28
	ldr	r3, .L107+32
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause1
.L106:
	pop	{r4, lr}
	b	game1.part.0
.L108:
	.align	2
.L107:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	pauseSoundA
	.word	pauseSong_length
	.word	pauseSong_data
	.word	playSoundB
	.size	game1, .-game1
	.align	2
	.global	pause1
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause1, %function
pause1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L116
	ldr	r4, .L116+4
	ldrh	r2, [r2]
	ldrh	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	strh	r3, [r4]	@ movhi
	beq	.L110
	ldr	r3, .L116+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L115
.L110:
	ldr	r3, .L116+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L116+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L116+20
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldrh	r3, [r4]
	lsr	r3, r3, #3
	strh	r3, [r2, #20]	@ movhi
	ldrh	r3, [r4]
	lsr	r3, r3, #2
	strh	r3, [r2, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	ldr	r3, .L116+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+28
	mov	lr, pc
	bx	r3
	bl	goToGame1
	b	.L110
.L117:
	.align	2
.L116:
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	stopSoundB
	.word	unpauseSoundA
	.size	pause1, .-pause1
	.align	2
	.global	goToPause2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause2, %function
goToPause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #9
	mov	r5, #67108864
	mov	r2, #1536
	ldr	r1, .L120
	ldr	r3, .L120+4
	str	r0, [r1]
	strh	r2, [r5]	@ movhi
	ldr	r4, .L120+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L120+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L120+16
	ldr	r2, .L120+20
	strh	r3, [r5, #12]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L120+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L120+28
	ldr	r2, .L120+32
	ldr	r1, .L120+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L120+40
	ldr	r1, .L120+44
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r0, #3
	ldr	r2, .L120+48
	ldr	r1, .L120+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L120+56
	ldr	r1, .L120+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	23556
	.word	7944
	.word	pauseBGPal
	.word	5984
	.word	100679680
	.word	pauseBGTiles
	.word	100720640
	.word	pauseBGMap
	.word	100696064
	.word	cloudsTiles
	.word	100726784
	.word	cloudsMap
	.size	goToPause2, .-goToPause2
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L134
	mov	lr, pc
	bx	r3
	ldr	r3, .L134+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L134+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L134+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L123
	ldr	r2, .L134+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L132
.L123:
	tst	r3, #4
	beq	.L122
	ldr	r3, .L134+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L133
.L122:
	pop	{r4, lr}
	bx	lr
.L132:
	ldr	r3, .L134+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L134+24
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L134+28
	ldr	r3, .L134+32
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause2
.L133:
	pop	{r4, lr}
	b	game2.part.0
.L135:
	.align	2
.L134:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	pauseSoundA
	.word	pauseSong_length
	.word	pauseSong_data
	.word	playSoundB
	.size	game2, .-game2
	.align	2
	.global	pause2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause2, %function
pause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L143
	ldr	r4, .L143+4
	ldrh	r2, [r2]
	ldrh	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	strh	r3, [r4]	@ movhi
	beq	.L137
	ldr	r3, .L143+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L142
.L137:
	ldr	r3, .L143+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L143+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L143+20
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldrh	r3, [r4]
	lsr	r3, r3, #3
	strh	r3, [r2, #20]	@ movhi
	ldrh	r3, [r4]
	lsr	r3, r3, #2
	strh	r3, [r2, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L142:
	ldr	r3, .L143+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+28
	mov	lr, pc
	bx	r3
	bl	goToGame2
	b	.L137
.L144:
	.align	2
.L143:
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	stopSoundB
	.word	unpauseSoundA
	.size	pause2, .-pause2
	.align	2
	.global	goToPause3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause3, %function
goToPause3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #10
	mov	r5, #67108864
	mov	r2, #1536
	ldr	r1, .L147
	ldr	r3, .L147+4
	str	r0, [r1]
	strh	r2, [r5]	@ movhi
	ldr	r4, .L147+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L147+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L147+16
	ldr	r2, .L147+20
	strh	r3, [r5, #12]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L147+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L147+28
	ldr	r2, .L147+32
	ldr	r1, .L147+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L147+40
	ldr	r1, .L147+44
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r0, #3
	ldr	r2, .L147+48
	ldr	r1, .L147+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L147+56
	ldr	r1, .L147+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L148:
	.align	2
.L147:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	23556
	.word	7944
	.word	pauseBGPal
	.word	5984
	.word	100679680
	.word	pauseBGTiles
	.word	100720640
	.word	pauseBGMap
	.word	100696064
	.word	cloudsTiles
	.word	100726784
	.word	cloudsMap
	.size	goToPause3, .-goToPause3
	.align	2
	.global	game3
	.syntax unified
	.arm
	.fpu softvfp
	.type	game3, %function
game3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L161
	mov	lr, pc
	bx	r3
	ldr	r3, .L161+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L161+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L161+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L150
	ldr	r2, .L161+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L159
.L150:
	tst	r3, #4
	beq	.L149
	ldr	r3, .L161+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L160
.L149:
	pop	{r4, lr}
	bx	lr
.L159:
	ldr	r3, .L161+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L161+24
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L161+28
	ldr	r3, .L161+32
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause3
.L160:
	pop	{r4, lr}
	b	game3.part.0
.L162:
	.align	2
.L161:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	pauseSoundA
	.word	pauseSong_length
	.word	pauseSong_data
	.word	playSoundB
	.size	game3, .-game3
	.align	2
	.global	pause3
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause3, %function
pause3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L170
	ldr	r4, .L170+4
	ldrh	r2, [r2]
	ldrh	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	strh	r3, [r4]	@ movhi
	beq	.L164
	ldr	r3, .L170+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L169
.L164:
	ldr	r3, .L170+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L170+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L170+20
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldrh	r3, [r4]
	lsr	r3, r3, #3
	strh	r3, [r2, #20]	@ movhi
	ldrh	r3, [r4]
	lsr	r3, r3, #2
	strh	r3, [r2, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L169:
	ldr	r3, .L170+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L170+28
	mov	lr, pc
	bx	r3
	bl	goToGame3
	b	.L164
.L171:
	.align	2
.L170:
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	stopSoundB
	.word	unpauseSoundA
	.size	pause3, .-pause3
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L199
	ldr	r8, .L199+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L199+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L199+12
	ldr	r2, [r6]
	ldrh	r0, [r8]
	ldr	r7, .L199+16
	ldr	fp, .L199+20
	ldr	r10, .L199+24
	ldr	r9, .L199+28
	ldr	r4, .L199+32
.L174:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #12
	ldrls	pc, [pc, r2, asl #2]
	b	.L190
.L176:
	.word	.L188
	.word	.L187
	.word	.L186
	.word	.L185
	.word	.L184
	.word	.L183
	.word	.L182
	.word	.L181
	.word	.L180
	.word	.L179
	.word	.L178
	.word	.L177
	.word	.L175
.L175:
	tst	r0, #8
	beq	.L190
	ldr	r3, .L199+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L177:
	tst	r0, #8
	beq	.L190
	ldr	r3, .L199+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L178:
	ldr	r3, .L199+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L179:
	ldr	r3, .L199+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L180:
	ldr	r3, .L199+52
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L181:
	ldr	r3, .L199+56
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L182:
	ldr	r3, .L199+60
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L183:
	ldr	r3, .L199+64
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L184:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L185:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L186:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L187:
	ldr	r1, [r7]
	tst	r0, #8
	add	r1, r1, #1
	str	r1, [r7]
	beq	.L190
	tst	r3, #8
	beq	.L198
.L190:
	mov	r0, r3
	b	.L174
.L188:
	tst	r0, #8
	beq	.L190
	tst	r3, #8
	bne	.L190
	ldr	r3, .L199+68
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L198:
	ldr	r3, .L199+72
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r8]
	b	.L174
.L200:
	.align	2
.L199:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	seed
	.word	instructions2
	.word	game1
	.word	transition1
	.word	67109120
	.word	lose.part.0
	.word	win.part.0
	.word	pause3
	.word	pause2
	.word	pause1
	.word	game3
	.word	transition2
	.word	game2
	.word	goToInstructions
	.word	goToInstructions2
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #11
	mov	r5, #67108864
	mov	r6, #256
	ldr	r2, .L203
	ldr	r3, .L203+4
	str	r1, [r2]
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L203+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L203+12
	mov	lr, pc
	bx	r4
	mov	r2, #7296
	mov	r3, r6
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L203+16
	mov	lr, pc
	bx	r4
	mov	r3, #15488
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L203+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L203+24
	ldr	r1, .L203+28
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L204:
	.align	2
.L203:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winPal
	.word	winTiles
	.word	100720640
	.word	winMap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L207
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L208:
	.align	2
.L207:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #12
	mov	r5, #67108864
	mov	r6, #256
	ldr	r2, .L211
	ldr	r3, .L211+4
	str	r1, [r2]
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L211+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L211+12
	mov	lr, pc
	bx	r4
	mov	r2, #7296
	mov	r3, r6
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L211+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L211+20
	ldr	r1, .L211+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L211+28
	ldr	r1, .L211+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L212:
	.align	2
.L211:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	losePal
	.word	18560
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
