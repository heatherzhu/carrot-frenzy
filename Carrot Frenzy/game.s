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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBunny.part.0, %function
drawBunny.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, [r0]
	ldr	r3, [r0, #28]
	ldr	r4, [r0, #36]
	ldr	ip, .L4
	lsl	r2, r2, #23
	add	r3, r3, #4
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	add	r1, r1, #1
	add	r3, r3, r4, lsl #5
	lsr	r2, r2, #23
	lsl	r0, r1, #3
	orr	r2, r2, #16384
	add	r1, ip, r1, lsl #3
	lsl	r3, r3, #1
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawBunny.part.0, .-drawBunny.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCarrot.part.0, %function
drawCarrot.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0]
	ldr	ip, [r0, #24]
	ldr	r2, [r0, #20]
	ldr	lr, .L8
	lsl	r3, r3, #23
	ldrb	r4, [r0, #4]	@ zero_extendqisi2
	add	r1, r1, #20
	lsr	r3, r3, #23
	add	ip, ip, #16
	lsl	r0, r1, #3
	orr	r3, r3, #16384
	add	r1, lr, r1, lsl #3
	add	r2, r2, ip, lsl #5
	strh	r4, [lr, r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.size	drawCarrot.part.0, .-drawCarrot.part.0
	.align	2
	.global	initializePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #117
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #120
	mov	r4, #30
	mov	lr, #8
	mov	r0, #1
	mov	r1, #16
	ldr	r3, .L12
	strb	ip, [r3, #44]
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #40]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.size	initializePlayer, .-initializePlayer
	.align	2
	.global	initializeBunny
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBunny, %function
initializeBunny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, [r3]
	cmp	r5, #0
	ble	.L14
	mov	r8, #1
	ldr	ip, .L24+4
	ldr	r3, .L24+8
	add	r4, r5, r5, lsl #2
	add	r5, r5, r4, lsl r8
	mov	lr, #16
	mov	r2, #0
	mov	r7, #6
	ldr	ip, [ip]
	add	r5, r3, r5, lsl #2
	b	.L19
.L16:
	cmp	ip, #2
	beq	.L23
	cmp	ip, #3
	bne	.L17
	add	r6, r1, #6
	add	r1, r1, #1
	cmp	r1, #3
	moveq	r1, #0
	lsl	r4, r0, #4
	lsl	r6, r6, #4
	add	r4, r4, #56
	str	r6, [r3]
	str	r4, [r3, #4]
	addeq	r0, r0, #1
.L17:
	str	lr, [r3, #8]
	str	lr, [r3, #12]
	str	r8, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r7, [r3, #40]
	add	r3, r3, #44
	cmp	r3, r5
	beq	.L14
.L19:
	cmp	ip, #1
	bne	.L16
	lsl	r6, r1, #4
	add	r4, r0, #4
	add	r1, r1, #1
	add	r6, r6, #104
	lsl	r4, r4, #4
	cmp	r1, #2
	str	r6, [r3]
	str	r4, [r3, #4]
	bne	.L17
.L22:
	mov	r1, #0
	add	r0, r0, #1
	b	.L17
.L23:
	add	r6, r1, #6
	add	r4, r0, #4
	add	r1, r1, #1
	lsl	r6, r6, #4
	lsl	r4, r4, #4
	cmp	r1, #3
	str	r6, [r3]
	str	r4, [r3, #4]
	bne	.L17
	b	.L22
.L14:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	bunniesNum
	.word	level
	.word	bunnies
	.size	initializeBunny, .-initializeBunny
	.align	2
	.global	initializeCoyote
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCoyote, %function
initializeCoyote:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L49
	ldr	r7, .L49+4
	ldr	r8, .L49+8
	ldr	r10, .L49+12
	ldr	r9, .L49+16
	add	r6, r4, #448
	b	.L36
.L44:
	cmp	r5, #2
	beq	.L41
	cmp	r5, #3
	beq	.L42
.L28:
	mov	r3, #0
	mov	r2, #1
	mov	r1, #5
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r1, [r4, #48]
	add	r4, r4, #56
	cmp	r4, r6
	beq	.L43
.L36:
	mov	r3, #16
	ldr	r5, [r7]
	cmp	r5, #1
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	mvneq	r3, #15
	bne	.L44
.L40:
	str	r3, [r4]
	mov	lr, pc
	bx	r8
	mov	r1, #108
	mov	r2, #2
	smull	r3, ip, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #3
.L39:
	add	r3, r3, r3, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #64
	str	r0, [r4, #4]
	strb	r1, [r4, #52]
	str	r2, [r4, #36]
	b	.L28
.L41:
	mov	lr, pc
	bx	r8
	ands	r3, r0, #1
	beq	.L45
	cmp	r0, #0
	rsblt	r3, r3, #0
	cmp	r3, #1
	bne	.L28
	ldr	r3, [r4, #8]
	add	r3, r3, #240
	str	r3, [r4]
	mov	lr, pc
	bx	r8
	mov	r2, #3
	smull	r3, ip, r9, r0
	asr	r3, r0, #31
	mov	r1, #114
	rsb	r3, r3, ip, asr r2
	b	.L39
.L42:
	mov	lr, pc
	bx	r8
	ands	r3, r0, #3
	beq	.L46
	rsbs	r0, r0, #0
	and	r0, r0, #3
	rsbpl	r3, r0, #0
	cmp	r3, #1
	beq	.L47
	cmp	r3, #2
	beq	.L48
	cmp	r3, #3
	bne	.L28
	mov	lr, pc
	bx	r8
	mov	r1, #100
	mov	r2, #1
	smull	r3, ip, r10, r0
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #4
	rsb	ip, r3, r3, lsl #3
	add	r3, r3, ip, lsl #2
	sub	r3, r0, r3
	ldr	r0, [r4, #12]
	add	r3, r3, #96
	add	r0, r0, #160
	str	r3, [r4]
	str	r0, [r4, #4]
	strb	r1, [r4, #52]
	str	r2, [r4, #36]
	b	.L28
.L43:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	str	r3, [r4]
	mov	lr, pc
	bx	r8
	mov	r2, #108
	smull	r3, r1, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #5
	sub	r0, r0, r3
	add	r0, r0, #64
	str	r5, [r4, #36]
	str	r0, [r4, #4]
	strb	r2, [r4, #52]
	b	.L28
.L46:
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	b	.L40
.L48:
	mov	lr, pc
	bx	r8
	mov	r1, #117
	mov	r2, #0
	smull	r3, ip, r10, r0
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #4
	rsb	ip, r3, r3, lsl #3
	add	r3, r3, ip, lsl #2
	sub	r3, r0, r3
	ldr	r0, [r4, #12]
	add	r3, r3, #96
	rsb	r0, r0, #0
	str	r3, [r4]
	str	r0, [r4, #4]
	strb	r1, [r4, #52]
	str	r2, [r4, #36]
	b	.L28
.L47:
	ldr	r3, [r4, #8]
	add	r3, r3, #240
	str	r3, [r4]
	mov	lr, pc
	bx	r8
	mov	r2, #114
	smull	r3, r1, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	add	r3, r3, #64
	str	r5, [r4, #36]
	str	r3, [r4, #4]
	strb	r2, [r4, #52]
	b	.L28
.L50:
	.align	2
.L49:
	.word	coyotes
	.word	level
	.word	rand
	.word	-1925330167
	.word	1041204193
	.size	initializeCoyote, .-initializeCoyote
	.align	2
	.global	initializeCarrot
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCarrot, %function
initializeCarrot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L72
	ldr	r6, .L72+4
	ldr	r4, .L72+8
	ldr	r8, .L72+12
	ldr	r10, .L72+16
	ldr	r7, .L72+20
	ldr	r9, .L72+24
	add	r5, fp, #320
	b	.L64
.L52:
	cmp	r2, #2
	beq	.L69
	cmp	r2, #3
	beq	.L70
.L56:
	mov	r2, #0
	mov	r1, #16
	str	r2, [fp, #16]
	str	r1, [fp, #8]
	str	r1, [fp, #12]
	str	r2, [fp, #20]
	str	r2, [fp, #24]
	str	r2, [fp, #28]
	add	fp, fp, #32
	cmp	fp, r5
	beq	.L71
.L64:
	ldr	r2, [r6]
	cmp	r2, #1
	bne	.L52
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L53
	mov	lr, pc
	bx	r4
	ldr	r2, .L72+28
	smull	r3, r2, r0, r2
	asr	r1, r0, #31
	add	r2, r2, r0
	rsb	r2, r1, r2, asr #6
	add	r1, r2, r2, lsl #2
	add	r1, r2, r1, lsl #1
	add	r2, r2, r1, lsl #3
	sub	r2, r0, r2
	str	r2, [fp]
.L59:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L60
	mov	lr, pc
	bx	r4
	smull	r3, r1, r9, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	rsb	r2, r2, r2, lsl #3
	rsb	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [fp, #4]
	b	.L56
.L60:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #104
	str	r0, [fp, #4]
	b	.L56
.L69:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L58
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [fp]
	b	.L59
.L70:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L61
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [fp]
.L62:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L63
	mov	lr, pc
	bx	r4
	smull	r3, r1, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl #3
	sub	r2, r0, r2
	str	r2, [fp, #4]
	b	.L56
.L53:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	add	r2, r2, #144
	str	r2, [fp]
	b	.L59
.L71:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L58:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r10, r0
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #152
	str	r0, [fp]
	b	.L59
.L63:
	mov	lr, pc
	bx	r4
	ldr	r1, .L72+32
	smull	r3, r1, r0, r1
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #5
	sub	r0, r0, r2
	add	r0, r0, #112
	str	r0, [fp, #4]
	b	.L56
.L61:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r10, r0
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #152
	str	r0, [fp]
	b	.L62
.L73:
	.align	2
.L72:
	.word	carrots
	.word	level
	.word	rand
	.word	1676084799
	.word	-529516515
	.word	424194301
	.word	1402438301
	.word	-1206451487
	.word	1041204193
	.size	initializeCarrot, .-initializeCarrot
	.align	2
	.global	initializeShoe
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeShoe, %function
initializeShoe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L94
	ldr	r6, .L94+4
	ldr	r4, .L94+8
	ldr	fp, .L94+12
	ldr	r9, .L94+16
	ldr	r7, .L94+20
	ldr	r8, .L94+24
	add	r5, r10, #800
	b	.L87
.L75:
	cmp	r2, #2
	beq	.L91
	cmp	r2, #3
	beq	.L92
.L79:
	mov	r2, #0
	mov	r1, #16
	mov	r0, #117
	str	r1, [r10, #8]
	str	r1, [r10, #12]
	str	r2, [r10, #16]
	str	r2, [r10, #20]
	str	r2, [r10, #24]
	str	r2, [r10, #28]
	str	r2, [r10, #32]
	strb	r0, [r10, #36]
	add	r10, r10, #40
	cmp	r10, r5
	beq	.L93
.L87:
	ldr	r2, [r6]
	cmp	r2, #1
	bne	.L75
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L76
	mov	lr, pc
	bx	r4
	ldr	r2, .L94+28
	smull	r3, r2, r0, r2
	asr	r1, r0, #31
	add	r2, r2, r0
	rsb	r2, r1, r2, asr #6
	add	r1, r2, r2, lsl #2
	add	r1, r2, r1, lsl #1
	add	r2, r2, r1, lsl #3
	sub	r2, r0, r2
	str	r2, [r10]
.L77:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	bne	.L90
	mov	lr, pc
	bx	r4
	ldr	r2, .L94+32
	smull	r3, r1, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r1, r2, r2, lsl #2
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #104
	str	r0, [r10, #4]
	b	.L79
.L90:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	rsb	r2, r2, r2, lsl #3
	rsb	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [r10, #4]
	b	.L79
.L91:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L81
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [r10]
.L82:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	bne	.L90
	mov	lr, pc
	bx	r4
	ldr	r1, .L94+32
	smull	r3, r2, r1, r0
	asr	r1, r0, #31
	rsb	r1, r1, r2, asr #4
	add	r2, r1, r1, lsl #2
	add	r1, r1, r2, lsl #3
	sub	r2, r0, r1
	add	r2, r2, #104
	str	r2, [r10, #4]
	b	.L79
.L92:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L84
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [r10]
.L85:
	mov	lr, pc
	bx	r4
	tst	r0, #1
	beq	.L86
	mov	lr, pc
	bx	r4
	ldr	r1, .L94+36
	smull	r3, r1, r0, r1
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	str	r2, [r10, #4]
	b	.L79
.L76:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r7, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #3
	add	r2, r2, r2, lsl #3
	sub	r2, r0, r2
	add	r2, r2, #144
	str	r2, [r10]
	b	.L77
.L81:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r9, r0
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #152
	str	r0, [r10]
	b	.L82
.L86:
	mov	lr, pc
	bx	r4
	smull	r3, r1, fp, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #5
	sub	r0, r0, r2
	add	r0, r0, #112
	str	r0, [r10, #4]
	b	.L79
.L84:
	mov	lr, pc
	bx	r4
	smull	r3, r1, r9, r0
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #3
	sub	r0, r0, r2
	add	r0, r0, #152
	str	r0, [r10]
	b	.L85
.L93:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	shoes
	.word	level
	.word	rand
	.word	1041204193
	.word	-529516515
	.word	424194301
	.word	1402438301
	.word	-1206451487
	.word	1676084799
	.word	-368140053
	.size	initializeShoe, .-initializeShoe
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, .L104
	ldr	lr, .L104+4
	ldr	r1, .L104+8
	ldr	r2, .L104+12
	cmp	r0, #1
	str	r0, [lr]
	str	r3, [ip]
	str	r3, [r1]
	str	r3, [r2]
	beq	.L102
	cmp	r0, #2
	beq	.L103
	cmp	r0, #3
	moveq	r3, #9
	moveq	lr, r3
	ldrne	r3, .L104+16
	ldreq	r2, .L104+16
	ldrne	lr, [r3]
	streq	r3, [r2]
.L98:
	mov	r4, #0
	ldr	r1, .L104+20
	ldr	r0, .L104+24
	ldr	ip, .L104+28
	ldr	r6, .L104+32
	ldr	r7, .L104+36
	str	r4, [r1]
	str	r4, [r0]
	ldr	r5, .L104+40
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L104+44
	ldr	r1, .L104+48
	str	lr, [ip]
	str	r4, [r6]
	str	r4, [r7]
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L104+52
	ldr	r1, .L104+56
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L104+60
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #4352
	mov	r5, #16
	mov	r2, #1
	mov	lr, #8
	mov	ip, #117
	mov	r9, #120
	mov	r8, #30
	strh	r1, [r3]	@ movhi
	ldr	r3, .L104+64
	ldr	r1, [r7]
	ldr	r0, [r6]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	str	r9, [r3]
	str	r8, [r3, #4]
	str	lr, [r3, #40]
	strb	ip, [r3, #44]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	bl	initializeBunny
	bl	initializeCoyote
	bl	initializeCarrot
	bl	initializeShoe
	mov	r0, #5
	mov	ip, #32
	mov	r1, #190
	mov	r6, #26
	mov	lr, #226
	mov	r7, #41
	ldr	r3, .L104+68
	ldr	r2, .L104+72
	stmib	r3, {r0, ip}
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r0, [r3]
	ldr	r3, .L104+76
	str	r1, [r2]
	stmib	r2, {r0, ip}
	str	r5, [r2, #12]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	str	r4, [r2, #24]
	str	r1, [r3]
	ldr	r2, .L104+80
	ldr	r1, .L104+84
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r6, [r3, #4]
	str	ip, [r3, #8]
	ldr	r3, .L104+88
	stmib	r1, {r0, r5}
	str	r5, [r1, #12]
	str	r4, [r1, #16]
	str	r4, [r1, #20]
	str	r4, [r1, #24]
	str	r4, [r1, #28]
	str	r4, [r1, #32]
	str	r7, [r1]
	str	lr, [r2]
	str	r0, [r2, #4]
	str	r5, [r2, #8]
	str	r5, [r2, #12]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	str	r4, [r2, #24]
	str	r4, [r2, #28]
	str	r4, [r2, #32]
	str	r6, [r3, #4]
	str	lr, [r3]
	str	r5, [r3, #8]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L103:
	mov	r3, #6
	ldr	r2, .L104+16
	mov	lr, r3
	str	r3, [r2]
	b	.L98
.L102:
	mov	r3, #4
	ldr	r2, .L104+16
	mov	lr, r3
	str	r3, [r2]
	b	.L98
.L105:
	.align	2
.L104:
	.word	carrotsCollected
	.word	level
	.word	shoesCollected
	.word	shoesSpawned
	.word	bunniesNum
	.word	time
	.word	cheatOn
	.word	bunniesToBeFed
	.word	count
	.word	count2
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	player
	.word	bunniesText
	.word	carrotsText
	.word	shoesText
	.word	countTextCarrots
	.word	countTextBunnies
	.word	countTextShoes
	.size	initializeGame, .-initializeGame
	.align	2
	.global	initializeBunniesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBunniesText, %function
initializeBunniesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #5
	mov	ip, #32
	mov	r0, #16
	ldr	r3, .L107
	stmib	r3, {r1, ip}
	str	r1, [r3]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	bx	lr
.L108:
	.align	2
.L107:
	.word	bunniesText
	.size	initializeBunniesText, .-initializeBunniesText
	.align	2
	.global	initializeCarrotsText
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCarrotsText, %function
initializeCarrotsText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #190
	mov	ip, #5
	mov	r0, #32
	mov	r1, #16
	ldr	r3, .L111
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L112:
	.align	2
.L111:
	.word	carrotsText
	.size	initializeCarrotsText, .-initializeCarrotsText
	.align	2
	.global	initializeShoesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeShoesText, %function
initializeShoesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #190
	mov	ip, #26
	mov	r0, #32
	mov	r1, #16
	ldr	r3, .L115
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L116:
	.align	2
.L115:
	.word	shoesText
	.size	initializeShoesText, .-initializeShoesText
	.align	2
	.global	initializeCountBunnies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCountBunnies, %function
initializeCountBunnies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #16
	ldr	r3, .L119
	str	lr, [sp, #-4]!
	ldm	r3, {r1, ip, lr}
	ldr	r3, .L119+4
	add	r1, r1, lr
	add	r1, r1, #4
	stm	r3, {r1, ip}
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L120:
	.align	2
.L119:
	.word	bunniesText
	.word	countTextBunnies
	.size	initializeCountBunnies, .-initializeCountBunnies
	.align	2
	.global	initializeCountCarrots
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCountCarrots, %function
initializeCountCarrots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #16
	ldr	r3, .L123
	str	lr, [sp, #-4]!
	ldm	r3, {r1, ip, lr}
	ldr	r3, .L123+4
	add	r1, r1, lr
	add	r1, r1, #4
	stm	r3, {r1, ip}
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L124:
	.align	2
.L123:
	.word	carrotsText
	.word	countTextCarrots
	.size	initializeCountCarrots, .-initializeCountCarrots
	.align	2
	.global	initializeCountShoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeCountShoes, %function
initializeCountShoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #16
	ldr	r3, .L127
	str	lr, [sp, #-4]!
	ldm	r3, {r1, ip, lr}
	ldr	r3, .L127+4
	add	r1, r1, lr
	add	r1, r1, #4
	stm	r3, {r1, ip}
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L128:
	.align	2
.L127:
	.word	shoesText
	.word	countTextShoes
	.size	initializeCountShoes, .-initializeCountShoes
	.align	2
	.global	updateBunny
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBunny, %function
updateBunny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L140
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	mov	r4, r0
	bne	.L130
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L137
	cmp	r3, #2
	beq	.L138
	cmp	r3, #3
	beq	.L139
.L130:
	ldr	r2, [r4, #24]
	ldr	r3, .L140+8
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L134
	ldr	r1, [r4, #36]
	ldr	r0, [r4, #40]
	add	r1, r1, #1
	cmp	r1, r0
	movlt	r3, r1
	str	r3, [r4, #36]
.L134:
	add	r2, r2, #1
	str	r2, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L137:
	ldr	r3, .L140+12
	mov	lr, pc
	bx	r3
	b	.L130
.L139:
	ldr	r3, .L140+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L140+20
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L140+24
	sub	r1, r1, #100
	ldr	r0, .L140+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L140+32
	mov	lr, pc
	bx	r3
	b	.L130
.L138:
	ldr	r3, .L140+36
	mov	lr, pc
	bx	r3
	b	.L130
.L141:
	.align	2
.L140:
	.word	bunniesToBeFed
	.word	level
	.word	1717986919
	.word	goToTransition1
	.word	stopSound
	.word	winSong_length
	.word	playSoundA
	.word	winSong_data
	.word	goToWin
	.word	goToTransition2
	.size	updateBunny, .-updateBunny
	.align	2
	.global	updateCoyote
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoyote, %function
updateCoyote:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r5, r0
	sub	sp, sp, #20
	bne	.L143
	ldr	r8, .L221
.L163:
	ldr	r3, [r8]
	cmp	r3, #1
	beq	.L144
	cmp	r3, #2
	beq	.L209
	cmp	r3, #3
	beq	.L210
.L165:
	ldr	r2, [r5, #32]
	ldr	r3, .L221+4
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	bne	.L175
	ldr	r1, [r5, #44]
	ldr	r0, [r5, #48]
	add	r1, r1, #1
	cmp	r1, r0
	movlt	r3, r1
	str	r3, [r5, #44]
.L175:
	add	r2, r2, #1
	str	r2, [r5, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L209:
	ldrb	r3, [r5, #52]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L144
	cmp	r3, #114
	bne	.L165
.L206:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L165
	mov	r2, #2
	ldr	r3, [r5]
	ldr	r1, [r5, #16]
	add	r3, r3, r1, lsl #1
	cmp	r3, #239
	str	r3, [r5]
	str	r2, [r5, #36]
	ble	.L165
.L169:
	mov	r3, #0
	str	r3, [r5, #28]
	b	.L165
.L144:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L165
	mov	r1, #3
	ldr	r3, [r5]
	ldr	r0, [r5, #16]
	ldr	r2, [r5, #8]
	sub	r3, r3, r0, lsl #1
	add	r2, r3, r2
	cmp	r2, #0
	str	r3, [r5]
	str	r1, [r5, #36]
	bgt	.L165
	b	.L169
.L143:
	ldr	r3, .L221+8
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r7, .L221+12
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L211
.L146:
	ldr	r8, .L221
	ldr	r4, [r8]
	cmp	r4, #1
	beq	.L212
	cmp	r4, #2
	beq	.L213
	cmp	r4, #3
	beq	.L214
.L150:
	ldr	r4, .L221+16
	ldr	fp, .L221+20
	ldr	r10, .L221+24
	ldr	r9, .L221+28
	add	r6, r4, #800
	b	.L155
.L161:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L163
.L155:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L161
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L161
	mov	r2, #0
	mov	r3, #1
	ldr	r1, [fp]
	str	r2, [r5, #24]
	str	r3, [r5, #28]
	mov	r0, r10
	str	r2, [r4, #20]
	sub	r1, r1, #200
	mov	lr, pc
	bx	r9
	b	.L161
.L210:
	ldrb	r3, [r5, #52]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L144
	cmp	r3, #114
	beq	.L206
	cmp	r3, #117
	beq	.L215
	cmp	r3, #100
	bne	.L165
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L165
	mov	r2, #0
	ldr	r3, [r5, #4]
	ldr	r1, [r5, #20]
	add	r3, r3, r1, lsl #1
	cmp	r3, #159
	str	r3, [r5, #4]
	str	r2, [r5, #36]
	bgt	.L169
	b	.L165
.L211:
	ldr	r3, .L221+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+36
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L221+40
	sub	r1, r1, #200
	ldr	r0, .L221+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+48
	mov	lr, pc
	bx	r3
	b	.L146
.L212:
	mov	r3, #36
	mov	r1, #64
	mov	r2, #104
	stmib	sp, {r1, r3}
	str	r3, [sp, #12]
	str	r2, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L216
.L208:
	ldr	r3, .L221+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L150
.L204:
	ldr	r3, [r5]
	ldr	r2, [r5, #16]
	add	r3, r3, r2
	str	r3, [r5]
	b	.L150
.L213:
	mov	r0, #96
	mov	r1, #64
	mov	r2, #48
	mov	r3, #36
	stm	sp, {r0, r1, r2, r3}
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L217
.L152:
	ldr	r3, .L221+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L150
	ldrb	r3, [r5, #52]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L204
	cmp	r3, #114
	bne	.L150
.L205:
	ldr	r3, [r5]
	ldr	r2, [r5, #16]
	sub	r3, r3, r2
	str	r3, [r5]
	b	.L150
.L214:
	mov	r3, #48
	mov	r1, #56
	mov	r2, #96
	stmib	sp, {r1, r3}
	str	r3, [sp, #12]
	str	r2, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L218
.L156:
	ldrb	r3, [r5, #52]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L208
	cmp	r3, #114
	beq	.L219
	cmp	r3, #117
	beq	.L220
	cmp	r3, #100
	bne	.L150
	ldr	r2, .L221+52
	ldr	r3, .L221+56
	ldr	r2, [r2]
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	ldreq	r3, [r5, #4]
	ldreq	r2, [r5, #20]
	subeq	r3, r3, r2
	streq	r3, [r5, #4]
	b	.L150
.L216:
	ldr	r3, .L221+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+36
	ldr	r1, [r3]
	mov	r2, r4
	ldr	r3, .L221+40
	sub	r1, r1, #200
	ldr	r0, .L221+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+48
	mov	lr, pc
	bx	r3
	b	.L208
.L215:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L165
	mov	r1, #1
	ldr	r3, [r5, #4]
	ldr	r0, [r5, #20]
	ldr	r2, [r5, #12]
	sub	r3, r3, r0, lsl r1
	add	r2, r3, r2
	cmp	r2, #0
	str	r3, [r5, #4]
	str	r1, [r5, #36]
	bgt	.L165
	b	.L169
.L217:
	ldr	r3, .L221+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+36
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L221+40
	sub	r1, r1, #200
	ldr	r0, .L221+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+48
	mov	lr, pc
	bx	r3
	b	.L152
.L218:
	ldr	r3, .L221+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+36
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L221+40
	sub	r1, r1, #200
	ldr	r0, .L221+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+48
	mov	lr, pc
	bx	r3
	b	.L156
.L219:
	ldr	r3, .L221+52
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L150
	b	.L205
.L220:
	ldr	r2, .L221+52
	ldr	r3, .L221+56
	ldr	r2, [r2]
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	ldreq	r3, [r5, #4]
	ldreq	r2, [r5, #20]
	addeq	r3, r3, r2
	streq	r3, [r5, #4]
	b	.L150
.L222:
	.align	2
.L221:
	.word	level
	.word	1717986919
	.word	player
	.word	collision
	.word	shoes
	.word	shoeImpact_length
	.word	shoeImpact_data
	.word	playSoundB
	.word	stopSound
	.word	loseSong_length
	.word	playSoundA
	.word	loseSong_data
	.word	goToLose
	.word	time
	.word	1431655766
	.size	updateCoyote, .-updateCoyote
	.align	2
	.global	spawnCoyote
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCoyote, %function
spawnCoyote:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L244
	mov	r3, #0
	mov	r2, r6
.L233:
	ldr	r5, [r2, #24]
	cmp	r5, #0
	beq	.L237
	add	r3, r3, #1
	cmp	r3, #8
	add	r2, r2, #56
	bne	.L233
.L223:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L237:
	mov	r9, #1
	ldr	r2, .L244+4
	ldr	r7, [r2]
	rsb	r3, r3, r3, lsl #3
	add	r8, r6, r3, lsl #3
	cmp	r7, r9
	str	r9, [r8, #24]
	lsl	r4, r3, #3
	beq	.L238
	cmp	r7, #2
	beq	.L239
	cmp	r7, #3
	bne	.L223
	ldr	r10, .L244+8
	mov	lr, pc
	bx	r10
	ands	r2, r0, #3
	beq	.L240
	rsbs	r3, r0, #0
	and	r3, r3, #3
	rsbpl	r2, r3, #0
	cmp	r2, #1
	beq	.L241
	cmp	r2, #2
	beq	.L242
	cmp	r2, #3
	bne	.L223
	mov	lr, pc
	bx	r10
	mov	r3, r0
	mov	r0, #100
	ldr	r2, .L244+12
	smull	r1, r2, r3, r2
	add	r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #4
	rsb	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #2
	sub	r3, r3, r2
	ldr	r2, [r8, #12]
	add	r3, r3, #96
	add	r2, r2, #160
	str	r9, [r8, #36]
	str	r3, [r6, r4]
	str	r2, [r8, #4]
	strb	r0, [r8, #52]
	b	.L223
.L238:
	ldr	r3, [r8, #8]
	rsb	r3, r3, #0
	ldr	r2, .L244+8
	str	r3, [r6, r4]
	mov	lr, pc
	bx	r2
.L236:
	mov	ip, #108
	mov	r1, #2
	ldr	r3, .L244+16
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	add	r3, r3, #64
	str	r3, [r8, #4]
	strb	ip, [r8, #52]
	str	r1, [r8, #36]
	b	.L223
.L239:
	ldr	r5, .L244+8
	mov	lr, pc
	bx	r5
	ands	r3, r0, #1
	beq	.L243
	cmp	r0, #0
	rsblt	r3, r3, #0
	cmp	r3, #1
	bne	.L223
	ldr	r3, [r8, #8]
	add	r3, r3, #240
	str	r3, [r6, r4]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	mov	r0, #3
	mov	ip, #114
	ldr	r2, .L244+16
	smull	lr, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr r0
	add	r2, r2, r2, lsl #5
	sub	r3, r3, r2
	add	r3, r3, #64
	str	r3, [r8, #4]
	strb	ip, [r8, #52]
	str	r0, [r8, #36]
	b	.L223
.L243:
	ldr	r3, [r8, #8]
	rsb	r3, r3, #0
	str	r3, [r6, r4]
	mov	lr, pc
	bx	r5
	mov	r1, #108
	ldr	r3, .L244+16
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	add	r3, r3, #64
	str	r7, [r8, #36]
	str	r3, [r8, #4]
	strb	r1, [r8, #52]
	b	.L223
.L240:
	ldr	r3, [r8, #8]
	rsb	r3, r3, #0
	str	r3, [r6, r4]
	mov	lr, pc
	bx	r10
	b	.L236
.L241:
	ldr	r3, [r8, #8]
	add	r3, r3, #240
	str	r3, [r6, r4]
	mov	lr, pc
	bx	r10
	mov	r3, r0
	mov	r0, #114
	ldr	r2, .L244+16
	smull	ip, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #5
	sub	r3, r3, r2
	add	r3, r3, #64
	str	r7, [r8, #36]
	str	r3, [r8, #4]
	strb	r0, [r8, #52]
	b	.L223
.L242:
	mov	lr, pc
	bx	r10
	mov	r3, r0
	mov	r0, #117
	ldr	r2, .L244+12
	smull	r1, r2, r3, r2
	add	r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #4
	rsb	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #2
	sub	r3, r3, r2
	ldr	r2, [r8, #12]
	add	r3, r3, #96
	rsb	r2, r2, #0
	str	r5, [r8, #36]
	str	r3, [r6, r4]
	str	r2, [r8, #4]
	strb	r0, [r8, #52]
	b	.L223
.L245:
	.align	2
.L244:
	.word	coyotes
	.word	level
	.word	rand
	.word	-1925330167
	.word	1041204193
	.size	spawnCoyote, .-spawnCoyote
	.align	2
	.global	updateCarrot
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCarrot, %function
updateCarrot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L273
	ldr	r3, [r5]
	cmp	r3, #9
	sub	sp, sp, #16
	bgt	.L246
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	r4, r0
	bne	.L270
.L246:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L270:
	ldr	r0, .L273+4
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	lr, [r4, #4]
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L273+8
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L246
	mov	r2, #0
	ldr	r1, .L273+12
	ldr	r3, [r5]
	ldr	r1, [r1]
	add	r3, r3, #1
	str	r3, [r5]
	str	r2, [r4, #16]
	ldr	r3, .L273+16
	ldr	r0, .L273+20
	sub	r1, r1, #200
	mov	lr, pc
	bx	r3
	ldr	r3, .L273+24
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L271
	cmp	r3, #2
	beq	.L272
	cmp	r3, #3
	bne	.L246
	ldr	r5, .L273+28
	mov	lr, pc
	bx	r5
	tst	r0, #1
	beq	.L258
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+32
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4]
.L259:
	mov	lr, pc
	bx	r5
	tst	r0, #1
	beq	.L260
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+36
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #3
	sub	r0, r0, r3
	str	r0, [r4, #4]
	b	.L246
.L271:
	ldr	r5, .L273+28
	mov	lr, pc
	bx	r5
	tst	r0, #1
	beq	.L251
	mov	lr, pc
	bx	r5
	ldr	r2, .L273+40
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl #1
	add	r3, r3, r2, lsl #3
	sub	r0, r0, r3
	str	r0, [r4]
.L256:
	mov	lr, pc
	bx	r5
	tst	r0, #1
	beq	.L257
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+44
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4, #4]
	b	.L246
.L257:
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+36
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #104
	str	r3, [r4, #4]
	b	.L246
.L272:
	ldr	r5, .L273+28
	mov	lr, pc
	bx	r5
	tst	r0, #1
	beq	.L255
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+32
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4]
	b	.L256
.L251:
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+32
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #144
	str	r3, [r4]
	b	.L256
.L255:
	mov	lr, pc
	bx	r5
	ldr	r2, .L273+48
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #152
	str	r3, [r4]
	b	.L256
.L258:
	mov	lr, pc
	bx	r5
	ldr	r2, .L273+48
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #152
	str	r3, [r4]
	b	.L259
.L260:
	mov	lr, pc
	bx	r5
	ldr	r3, .L273+52
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	add	r3, r3, #112
	str	r3, [r4, #4]
	b	.L246
.L274:
	.align	2
.L273:
	.word	carrotsCollected
	.word	player
	.word	collision
	.word	collect_length
	.word	playSoundB
	.word	collect_data
	.word	level
	.word	rand
	.word	424194301
	.word	1676084799
	.word	-1206451487
	.word	1402438301
	.word	-529516515
	.word	1041204193
	.size	updateCarrot, .-updateCarrot
	.align	2
	.global	spawnCarrot
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCarrot, %function
spawnCarrot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L280
	b	.L278
.L276:
	cmp	r3, #10
	bxeq	lr
.L278:
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	add	r3, r3, #1
	bne	.L276
	mov	r1, #1
	ldr	r3, .L280+4
	add	r2, r3, r2
	str	r1, [r2, #16]
	bx	lr
.L281:
	.align	2
.L280:
	.word	carrots+16
	.word	carrots
	.size	spawnCarrot, .-spawnCarrot
	.align	2
	.global	updateShoe
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShoe, %function
updateShoe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L321
	ldr	r3, [r5]
	cmp	r3, #9
	mov	r4, r0
	sub	sp, sp, #16
	bgt	.L284
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L314
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L282
.L306:
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	cmp	r3, #117
	beq	.L315
	cmp	r3, #100
	beq	.L316
	cmp	r3, #108
	beq	.L317
	cmp	r3, #114
	beq	.L318
.L282:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L314:
	ldr	r0, .L321+4
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldr	lr, [r4, #4]
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L321+8
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L284
	mov	r2, #0
	ldr	r3, .L321+12
	ldr	r3, [r3]
	cmp	r3, #1
	str	r2, [r4, #16]
	beq	.L319
	cmp	r3, #2
	beq	.L320
	cmp	r3, #3
	bne	.L291
	ldr	r6, .L321+16
	mov	lr, pc
	bx	r6
	tst	r0, #1
	beq	.L296
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4]
.L297:
	mov	lr, pc
	bx	r6
	tst	r0, #1
	beq	.L298
	mov	lr, pc
	bx	r6
	ldr	r2, .L321+24
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4, #4]
.L291:
	ldr	r0, .L321+28
	ldr	r3, .L321+32
	ldr	r2, [r0]
	ldr	r1, [r3]
	ldr	r3, [r5]
	sub	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r0]
	str	r3, [r5]
	mov	r2, #0
	ldr	r0, .L321+36
	ldr	r3, .L321+40
	sub	r1, r1, #200
	mov	lr, pc
	bx	r3
.L284:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L282
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L306
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L315:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subge	r3, r3, #4
	strge	r3, [r4, #4]
	bge	.L282
.L303:
	mov	r3, #0
	str	r3, [r4, #20]
	b	.L282
.L316:
	ldr	r3, [r4, #4]
	cmp	r3, #160
	addle	r3, r3, #4
	strle	r3, [r4, #4]
	ble	.L282
	b	.L303
.L318:
	ldr	r3, [r4]
	cmp	r3, #240
	addle	r3, r3, #4
	strle	r3, [r4]
	ble	.L282
	b	.L303
.L317:
	ldr	r3, [r4]
	cmp	r3, #0
	subge	r3, r3, #4
	strge	r3, [r4]
	bge	.L282
	b	.L303
.L319:
	ldr	r6, .L321+16
	mov	lr, pc
	bx	r6
	tst	r0, #1
	beq	.L288
	mov	lr, pc
	bx	r6
	ldr	r2, .L321+44
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl #1
	add	r3, r3, r2, lsl #3
	sub	r0, r0, r3
	str	r0, [r4]
.L294:
	mov	lr, pc
	bx	r6
	tst	r0, #1
	beq	.L295
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+48
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4, #4]
	b	.L291
.L295:
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+52
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #104
	str	r3, [r4, #4]
	b	.L291
.L320:
	ldr	r6, .L321+16
	mov	lr, pc
	bx	r6
	tst	r0, #1
	beq	.L293
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r4]
	b	.L294
.L288:
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #144
	str	r3, [r4]
	b	.L294
.L293:
	mov	lr, pc
	bx	r6
	ldr	r2, .L321+56
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #152
	str	r3, [r4]
	b	.L294
.L298:
	mov	lr, pc
	bx	r6
	ldr	r3, .L321+60
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #5
	sub	r3, r0, r3
	add	r3, r3, #112
	str	r3, [r4, #4]
	b	.L291
.L296:
	mov	lr, pc
	bx	r6
	ldr	r2, .L321+56
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #152
	str	r3, [r4]
	b	.L297
.L322:
	.align	2
.L321:
	.word	shoesCollected
	.word	player
	.word	collision
	.word	level
	.word	rand
	.word	424194301
	.word	-368140053
	.word	shoesSpawned
	.word	collect_length
	.word	collect_data
	.word	playSoundB
	.word	-1206451487
	.word	1402438301
	.word	1676084799
	.word	-529516515
	.word	1041204193
	.size	updateShoe, .-updateShoe
	.align	2
	.global	spawnShoe
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnShoe, %function
spawnShoe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L347
	mov	r4, #0
	mov	r3, r5
.L338:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L324
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L343
.L324:
	add	r4, r4, #1
	cmp	r4, #20
	add	r3, r3, #40
	bne	.L338
.L323:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L343:
	mov	ip, #1
	ldr	r0, .L347+4
	ldr	r3, .L347+8
	ldr	r2, [r0]
	ldr	r1, [r3]
	add	r2, r2, ip
	add	r3, r4, r4, lsl #2
	str	r2, [r0]
	cmp	r1, ip
	add	r2, r5, r3, lsl #3
	str	ip, [r2, #16]
	lsl	r6, r3, #3
	lsl	r7, r4, #2
	beq	.L344
	cmp	r1, #2
	beq	.L345
	cmp	r1, #3
	bne	.L323
	ldr	r8, .L347+12
	mov	lr, pc
	bx	r8
	tst	r0, #1
	beq	.L335
	mov	lr, pc
	bx	r8
	mov	r2, r0
	ldr	r3, .L347+16
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r2, r3
	str	r3, [r5, r6]
.L336:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	beq	.L337
	mov	lr, pc
	bx	r8
	ldr	r3, .L347+20
	smull	r1, r3, r0, r3
	add	r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl #2
	add	r4, r7, r4
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r4, lsl #3
	sub	r3, r0, r3
	str	r3, [r5, #4]
	b	.L323
.L344:
	ldr	r8, .L347+12
	mov	lr, pc
	bx	r8
	tst	r0, #1
	bne	.L346
	mov	lr, pc
	bx	r8
	ldr	r3, .L347+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #144
	str	r3, [r5, r6]
.L332:
	mov	lr, pc
	bx	r8
	tst	r0, #1
	beq	.L333
	mov	lr, pc
	bx	r8
	ldr	r3, .L347+24
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #3
	add	r4, r7, r4
	rsb	r3, r3, r3, lsl #3
	add	r5, r5, r4, lsl #3
	sub	r3, r0, r3
	str	r3, [r5, #4]
	b	.L323
.L345:
	ldr	r8, .L347+12
	mov	lr, pc
	bx	r8
	tst	r0, #1
	beq	.L331
	mov	lr, pc
	bx	r8
	ldr	r3, .L347+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #3
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3
	str	r3, [r5, r6]
	b	.L332
.L346:
	mov	lr, pc
	bx	r8
	ldr	r2, .L347+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl #1
	add	r3, r3, r2, lsl #3
	sub	r0, r0, r3
	str	r0, [r5, r6]
	b	.L332
.L331:
	mov	lr, pc
	bx	r8
	ldr	r2, .L347+32
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #3
	sub	r3, r0, r3
	add	r3, r3, #152
	str	r3, [r5, r6]
	b	.L332
.L333:
	mov	lr, pc
	bx	r8
	ldr	r3, .L347+36
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #3
	add	r4, r7, r4
	sub	r3, r0, r3
	add	r5, r5, r4, lsl #3
	add	r3, r3, #104
	str	r3, [r5, #4]
	b	.L323
.L337:
	mov	lr, pc
	bx	r8
	mov	r3, r0
	ldr	r2, .L347+40
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #5
	add	r4, r7, r4
	sub	r3, r3, r2
	add	r5, r5, r4, lsl #3
	add	r3, r3, #112
	str	r3, [r5, #4]
	b	.L323
.L335:
	mov	lr, pc
	bx	r8
	ldr	r1, .L347+32
	smull	r2, r1, r0, r1
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r1, r2, r2, lsl #3
	add	r2, r2, r1, lsl #3
	sub	r3, r0, r2
	add	r3, r3, #152
	str	r3, [r5, r6]
	b	.L336
.L348:
	.align	2
.L347:
	.word	shoes
	.word	shoesSpawned
	.word	level
	.word	rand
	.word	424194301
	.word	-368140053
	.word	1402438301
	.word	-1206451487
	.word	-529516515
	.word	1676084799
	.word	1041204193
	.size	spawnShoe, .-spawnShoe
	.align	2
	.global	throwShoe
	.syntax unified
	.arm
	.fpu softvfp
	.type	throwShoe, %function
throwShoe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L359
	mov	r0, #0
	mov	r3, ip
	b	.L352
.L350:
	add	r0, r0, #1
	cmp	r0, #20
	add	r3, r3, #40
	bxeq	lr
.L352:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L350
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L350
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r3, .L359+4
	ldr	lr, .L359+8
	ldr	r5, [r3]
	ldr	r1, .L359+12
	add	r0, r0, r0, lsl #2
	str	r5, [ip, r0, lsl #3]
	ldr	r1, [r1]
	add	r0, ip, r0, lsl #3
	ldr	r5, [r3, #4]
	ldrb	ip, [r3, #44]	@ zero_extendqisi2
	ldr	r3, [lr]
	str	r5, [r0, #4]
	str	r4, [r0, #20]
	strb	ip, [r0, #36]
	ldr	r4, .L359+16
	sub	r3, r3, #1
	ldr	r0, .L359+20
	sub	r1, r1, #200
	str	r3, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L360:
	.align	2
.L359:
	.word	shoes
	.word	player
	.word	shoesCollected
	.word	shoeThrow_length
	.word	playSoundB
	.word	shoeThrow_data
	.size	throwShoe, .-throwShoe
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L538
	ldr	r3, [r4, #28]
	cmp	r3, #4
	movne	r2, #4
	strne	r3, [r4, #32]
	strne	r2, [r4, #28]
	ldr	r3, .L538+4
	ldr	r2, [r4, #24]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3
	sub	sp, sp, #16
	bne	.L364
	ldr	r2, [r4, #36]
	ldr	r1, [r4, #40]
	add	r2, r2, #1
	cmp	r2, r1
	movge	r2, r3
	str	r2, [r4, #36]
.L364:
	ldr	r2, .L538+8
	ldrh	r3, [r2, #48]
	ands	r3, r3, #64
	bne	.L366
	ldr	r6, .L538+12
	ldr	r2, [r6]
	cmp	r2, #1
	str	r3, [r4, #28]
	beq	.L522
	cmp	r2, #2
	beq	.L523
	cmp	r2, #3
	beq	.L524
.L368:
	mov	r3, #117
	strb	r3, [r4, #44]
.L370:
	ldr	r5, .L538+16
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L382
	ldr	r2, .L538+20
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L382
	ldr	r2, .L538+24
	ldr	r2, [r2]
	cmp	r2, #0
	bgt	.L525
.L382:
	tst	r3, #256
	beq	.L383
	ldr	r3, .L538+20
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L383
	mov	r1, #1
	mov	r2, #1000
	ldr	r3, .L538+28
	str	r1, [r3]
	ldr	r3, .L538+24
	str	r2, [r3]
.L383:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	moveq	r2, #0
	ldrne	r3, [r4, #24]
	ldreq	r3, [r4, #32]
	addne	r3, r3, #1
	streq	r3, [r4, #28]
	strne	r3, [r4, #24]
	ldr	r3, [r4]
	streq	r2, [r4, #36]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4]
	blt	.L387
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #240
	rsbgt	r2, r2, #240
	strgt	r2, [r4]
.L387:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	blt	.L389
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #160
	rsbgt	r2, r2, #160
	strgt	r2, [r4, #4]
.L389:
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L526
	cmp	r3, #2
	beq	.L527
	cmp	r3, #3
	beq	.L528
.L361:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L366:
	ldrh	r3, [r2, #48]
	tst	r3, #128
	bne	.L371
	mov	r2, #1
	ldr	r6, .L538+12
	ldr	r3, [r6]
	cmp	r3, r2
	str	r2, [r4, #28]
	beq	.L529
	cmp	r3, #2
	beq	.L530
	cmp	r3, #3
	beq	.L531
.L373:
	mov	r3, #100
	strb	r3, [r4, #44]
	b	.L370
.L371:
	ldrh	r3, [r2, #48]
	tst	r3, #16
	bne	.L375
	mov	r2, #2
	ldr	r6, .L538+12
	ldr	r3, [r6]
	cmp	r3, #1
	str	r2, [r4, #28]
	beq	.L532
	cmp	r3, #2
	beq	.L533
	cmp	r3, #3
	beq	.L534
.L377:
	mov	r3, #114
	strb	r3, [r4, #44]
	b	.L370
.L526:
	mov	r3, #40
	mov	r1, #60
	mov	r2, #100
	stmib	sp, {r1, r3}
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L538+32
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L361
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L361
	ldr	r3, .L538+20
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L361
	ldr	ip, .L538+36
	ldr	r4, [ip]
	cmp	r4, #0
	ble	.L361
	ldr	r2, .L538+40
	ldr	lr, [r2]
	cmp	lr, #0
	ble	.L361
	ldr	r0, .L538+44
	mov	r2, r0
	b	.L395
.L394:
	add	r3, r3, #1
	cmp	lr, r3
	add	r2, r2, #44
	beq	.L361
.L395:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L394
	mov	r5, #1
	mov	r2, #0
	ldr	lr, .L538+48
	sub	r4, r4, #1
	str	r4, [ip]
	ldr	ip, [lr]
	ldr	r1, .L538+52
	sub	ip, ip, #1
	str	ip, [lr]
	add	ip, r3, r3, lsl #2
	add	r3, r3, ip, lsl r5
	ldr	r1, [r1]
	add	r3, r0, r3, lsl #2
	str	r5, [r3, #20]
	ldr	r0, .L538+56
	ldr	r4, .L538+60
	str	r2, [r3, #16]
	sub	r1, r1, #200
	mov	lr, pc
	bx	r4
	b	.L361
.L522:
	ldm	r4, {r0, r2}
	rsb	r3, r2, r2, lsl #4
	add	r1, r0, r3, lsl #4
	ldr	ip, .L538+64
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	lsl	r3, r3, #4
	beq	.L368
	ldr	r1, [r4, #16]
	add	r3, r3, r1
	add	r3, r3, r0
	sub	r3, r3, #241
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	sub	r2, r2, #1
	cmp	r3, #0
	strne	r2, [r4, #4]
	b	.L368
.L375:
	ldrh	r3, [r2, #48]
	tst	r3, #32
	beq	.L501
	ldr	r6, .L538+12
	b	.L370
.L525:
	bl	throwShoe
	ldrh	r3, [r5]
	b	.L382
.L529:
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	add	r3, r0, r3
	rsb	r3, r3, r3, lsl #4
	ldr	ip, .L538+64
	add	r2, r1, r3, lsl #4
.L521:
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L373
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	add	r3, r3, r1
	sub	r3, r3, #241
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	addne	r3, r0, #1
	strne	r3, [r4, #4]
	b	.L373
.L524:
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	rsb	r3, r0, r0, lsl #4
	ldr	ip, .L538+68
	add	r2, r1, r3, lsl #4
.L519:
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L368
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	add	r3, r3, r1
	sub	r3, r3, #241
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	sub	r3, r0, #1
	strne	r3, [r4, #4]
	b	.L368
.L527:
	mov	r0, #92
	mov	r1, #60
	mov	r2, #58
	mov	r3, #44
	stm	sp, {r0, r1, r2, r3}
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L538+32
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L361
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L361
	ldr	r3, .L538+20
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L361
	ldr	ip, .L538+36
	ldr	r4, [ip]
	cmp	r4, #0
	ble	.L361
	ldr	r2, .L538+40
	ldr	lr, [r2]
	cmp	lr, #0
	ble	.L361
	ldr	r0, .L538+44
	mov	r2, r0
	b	.L398
.L397:
	add	r3, r3, #1
	cmp	r3, lr
	add	r2, r2, #44
	beq	.L361
.L398:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L397
.L507:
	mov	lr, #1
	mov	r2, #0
	ldr	r5, .L538+48
	sub	r4, r4, #1
	str	r4, [ip]
	ldr	ip, [r5]
	ldr	r1, .L538+52
	sub	ip, ip, #1
	str	ip, [r5]
	add	ip, r3, r3, lsl #2
	add	r3, r3, ip, lsl lr
	ldr	r1, [r1]
	add	r3, r0, r3, lsl #2
	str	lr, [r3, #20]
	ldr	r0, .L538+56
	ldr	r4, .L538+60
	str	r2, [r3, #16]
	sub	r1, r1, #200
	mov	lr, pc
	bx	r4
	b	.L361
.L528:
	mov	r3, #58
	mov	r1, #52
	mov	r2, #92
	stmib	sp, {r1, r3}
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L538+32
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L361
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L361
	ldr	r3, .L538+20
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L361
	ldr	ip, .L538+36
	ldr	r4, [ip]
	cmp	r4, #0
	ble	.L361
	ldr	r2, .L538+40
	ldr	lr, [r2]
	cmp	lr, #0
	ble	.L361
	ldr	r0, .L538+44
	mov	r2, r0
	b	.L400
.L399:
	add	r3, r3, #1
	cmp	r3, lr
	add	r2, r2, #44
	beq	.L361
.L400:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L399
	b	.L507
.L523:
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	rsb	r3, r0, r0, lsl #4
	ldr	ip, .L538+72
	add	r2, r1, r3, lsl #4
	b	.L519
.L501:
	mov	r2, #3
	ldr	r6, .L538+12
	ldr	r3, [r6]
	cmp	r3, #1
	str	r2, [r4, #28]
	beq	.L535
	cmp	r3, #2
	beq	.L536
	cmp	r3, #3
	beq	.L537
.L380:
	mov	r3, #108
	strb	r3, [r4, #44]
	b	.L370
.L530:
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	add	r3, r0, r3
	rsb	r3, r3, r3, lsl #4
	ldr	ip, .L538+72
	add	r2, r1, r3, lsl #4
	b	.L521
.L535:
	ldm	r4, {r1, r3}
	rsb	r2, r3, r3, lsl #4
	sub	r1, r1, #1
	ldr	r0, .L538+64
	add	r2, r1, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L380
.L516:
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	sub	r3, r3, #1
	rsb	r3, r3, r3, lsl #4
	add	r3, r1, r3, lsl #4
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	strne	r1, [r4]
	b	.L380
.L534:
	ldm	r4, {r0, r2}
	ldr	r3, [r4, #16]
	rsb	r1, r2, r2, lsl #4
	add	r3, r0, r3
	ldr	ip, .L538+68
	add	r1, r3, r1, lsl #4
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	beq	.L377
.L513:
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	sub	r2, r2, #1
	sub	r3, r3, #1
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r2, lsl #4
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	addne	r0, r0, #1
	strne	r0, [r4]
	b	.L377
.L532:
	ldm	r4, {r0, r2}
	ldr	r3, [r4, #16]
	rsb	r1, r2, r2, lsl #4
	add	r3, r0, r3
	ldr	ip, .L538+64
	add	r1, r3, r1, lsl #4
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	beq	.L377
	b	.L513
.L531:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r0, [r4]
	add	r3, r1, r3
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, r3, lsl #4
	ldr	ip, .L538+68
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L373
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	add	r3, r3, r0
	sub	r3, r3, #241
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	addne	r1, r1, #1
	strne	r1, [r4, #4]
	b	.L373
.L533:
	ldm	r4, {r0, r2}
	ldr	r3, [r4, #16]
	rsb	r1, r2, r2, lsl #4
	add	r3, r0, r3
	ldr	ip, .L538+72
	add	r1, r3, r1, lsl #4
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	beq	.L377
	b	.L513
.L536:
	ldm	r4, {r1, r3}
	rsb	r2, r3, r3, lsl #4
	sub	r1, r1, #1
	ldr	r0, .L538+72
	add	r2, r1, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L380
	b	.L516
.L537:
	ldm	r4, {r1, r3}
	rsb	r2, r3, r3, lsl #4
	sub	r1, r1, #1
	ldr	r0, .L538+68
	add	r2, r1, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L380
	b	.L516
.L539:
	.align	2
.L538:
	.word	player
	.word	1717986919
	.word	67109120
	.word	level
	.word	oldButtons
	.word	buttons
	.word	shoesCollected
	.word	cheatOn
	.word	collision
	.word	carrotsCollected
	.word	bunniesNum
	.word	bunnies
	.word	bunniesToBeFed
	.word	feedBunny_length
	.word	feedBunny_data
	.word	playSoundB
	.word	gameBGLevel1_collisionBitmap
	.word	gameBGLevel3_collisionBitmap
	.word	gameBGLevel2_collisionBitmap
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBunniesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBunniesText, %function
updateBunniesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateBunniesText, .-updateBunniesText
	.align	2
	.global	updateCarrotsText
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCarrotsText, %function
updateCarrotsText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateCarrotsText, .-updateCarrotsText
	.align	2
	.global	updateShoesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShoesText, %function
updateShoesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateShoesText, .-updateShoesText
	.align	2
	.global	updateCountBunnies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCountBunnies, %function
updateCountBunnies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L557
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L556
	cmp	r3, #1
	beq	.L556
	cmp	r3, #2
	beq	.L556
	cmp	r3, #3
	beq	.L556
	cmp	r3, #4
	beq	.L556
	cmp	r3, #5
	beq	.L556
	cmp	r3, #6
	beq	.L556
	cmp	r3, #7
	beq	.L556
	cmp	r3, #8
	beq	.L556
	cmp	r3, #9
	moveq	r2, #9
	ldreq	r3, .L557+4
	streq	r2, [r3, #20]
	bx	lr
.L556:
	ldr	r2, .L557+4
	str	r3, [r2, #20]
	bx	lr
.L558:
	.align	2
.L557:
	.word	bunniesToBeFed
	.word	countTextBunnies
	.size	updateCountBunnies, .-updateCountBunnies
	.align	2
	.global	updateCountCarrots
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCountCarrots, %function
updateCountCarrots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L573
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L571
	cmp	r3, #1
	beq	.L571
	cmp	r3, #2
	beq	.L571
	cmp	r3, #3
	beq	.L571
	cmp	r3, #4
	beq	.L571
	cmp	r3, #5
	beq	.L571
	cmp	r3, #6
	beq	.L571
	cmp	r3, #7
	beq	.L571
	cmp	r3, #8
	beq	.L571
	cmp	r3, #9
	beq	.L572
	cmp	r3, #10
	bxne	lr
.L571:
	ldr	r2, .L573+4
	str	r3, [r2, #20]
	bx	lr
.L572:
	mov	r2, #9
	ldr	r3, .L573+4
	str	r2, [r3, #20]
	bx	lr
.L574:
	.align	2
.L573:
	.word	carrotsCollected
	.word	countTextCarrots
	.size	updateCountCarrots, .-updateCountCarrots
	.align	2
	.global	updateCountShoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCountShoes, %function
updateCountShoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L593
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L591
	cmp	r3, #1
	beq	.L591
	cmp	r3, #2
	beq	.L591
	cmp	r3, #3
	beq	.L591
	cmp	r3, #4
	beq	.L591
	cmp	r3, #5
	beq	.L591
	cmp	r3, #6
	beq	.L591
	cmp	r3, #7
	beq	.L591
	cmp	r3, #8
	beq	.L591
	cmp	r3, #9
	beq	.L592
	movgt	r2, #10
	ldrgt	r3, .L593+4
	strgt	r2, [r3, #20]
	bx	lr
.L591:
	ldr	r2, .L593+4
	str	r3, [r2, #20]
	bx	lr
.L592:
	mov	r2, #9
	ldr	r3, .L593+4
	str	r2, [r3, #20]
	bx	lr
.L594:
	.align	2
.L593:
	.word	shoesCollected
	.word	countTextShoes
	.size	updateCountShoes, .-updateCountShoes
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L630
	bl	updatePlayer
	ldr	r3, [r6]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L630+4
	ble	.L599
.L598:
	mov	r0, r4
	bl	updateBunny
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #44
	bgt	.L598
.L599:
	ldr	r4, .L630+8
	add	r5, r4, #448
.L597:
	mov	r0, r4
	add	r4, r4, #56
	bl	updateCoyote
	cmp	r5, r4
	bne	.L597
	ldr	r6, .L630+12
	mov	r4, r6
	add	r5, r6, #320
.L600:
	mov	r0, r4
	add	r4, r4, #32
	bl	updateCarrot
	cmp	r5, r4
	bne	.L600
	ldr	r4, .L630+16
	add	r5, r4, #800
.L601:
	mov	r0, r4
	add	r4, r4, #40
	bl	updateShoe
	cmp	r4, r5
	bne	.L601
	ldr	r4, .L630+20
	bl	updateCountBunnies
	bl	updateCountCarrots
	bl	updateCountShoes
	ldr	r1, [r4]
	cmp	r1, #0
	ldr	r3, .L630+24
	bne	.L602
	ldr	ip, [r3]
.L603:
	mov	r3, #0
	ldr	r0, .L630+28
.L608:
	ldr	r2, [r0, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	add	r3, r3, #1
	beq	.L625
	cmp	r3, #10
	bne	.L608
	cmp	ip, #10
	bgt	.L609
.L629:
	cmp	r1, #0
	bne	.L610
.L611:
	bl	spawnShoe
	ldr	r1, [r4]
.L609:
	ldr	r3, .L630+32
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L626
.L612:
	cmp	r3, #2
	beq	.L627
	cmp	r3, #3
	beq	.L628
.L613:
	add	ip, r1, #1
	str	ip, [r4]
	mov	r3, #512
	ldr	r4, .L630+36
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L630+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L602:
	cmp	r1, #400
	ldr	ip, [r3]
	blt	.L604
	ldr	r2, .L630+44
	ldr	r3, .L630+48
	mla	r3, r1, r3, r2
	ldr	r2, .L630+52
	cmp	r2, r3, ror #4
	bcs	.L603
	cmp	ip, #10
	bgt	.L609
.L616:
	ldr	r2, .L630+44
	ldr	r3, .L630+48
	mla	r3, r1, r3, r2
	ldr	r2, .L630+56
	cmp	r2, r3, ror #3
	bcs	.L611
	b	.L609
.L604:
	cmp	ip, #10
	bgt	.L609
.L610:
	cmp	r1, #199
	bgt	.L616
	ldr	r3, .L630+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L612
.L626:
	cmp	r1, #500
	blt	.L613
	ldr	r2, .L630+60
	ldr	r3, .L630+64
	mla	r3, r1, r3, r2
	ldr	r2, .L630+68
	cmp	r2, r3, ror #2
	bcc	.L613
.L615:
	bl	spawnCoyote
	ldr	r1, [r4]
	b	.L613
.L627:
	cmp	r1, #500
	blt	.L613
	ldr	r2, .L630+44
	ldr	r3, .L630+48
	mla	r3, r1, r3, r2
	ldr	r2, .L630+52
	cmp	r2, r3, ror #4
	bcc	.L613
	b	.L615
.L625:
	mov	r3, #1
	add	r2, r6, r2
	cmp	ip, #10
	str	r3, [r2, #16]
	ble	.L629
	b	.L609
.L628:
	cmp	r1, #500
	blt	.L613
	add	r3, r3, #-1778384896
	ldr	r2, .L630+72
	add	r3, r3, #3129344
	add	r3, r3, #2400
	mla	r3, r1, r3, r2
	ldr	r2, .L630+76
	cmp	r2, r3, ror #2
	bcc	.L613
	b	.L615
.L631:
	.align	2
.L630:
	.word	bunniesNum
	.word	bunnies
	.word	coyotes
	.word	carrots
	.word	shoes
	.word	time
	.word	shoesSpawned
	.word	carrots+16
	.word	level
	.word	DMANow
	.word	shadowOAM
	.word	85899344
	.word	-1030792151
	.word	10737418
	.word	21474836
	.word	17179868
	.word	652835029
	.word	8589934
	.word	28633112
	.word	14316556
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L633
	ldr	r3, [r1]
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #28]
	lsl	r3, r3, #23
	ldr	r0, .L633+4
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L634:
	.align	2
.L633:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBunny
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBunny, %function
drawBunny:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #16]
	cmp	r2, #0
	mov	r2, r1
	beq	.L636
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	drawBunny.part.0
.L636:
	mov	r3, #512
	ldr	r1, .L640
	add	r1, r1, r2, lsl #3
	strh	r3, [r1, #8]	@ movhi
	bx	lr
.L641:
	.align	2
.L640:
	.word	shadowOAM
	.size	drawBunny, .-drawBunny
	.align	2
	.global	drawCoyote
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoyote, %function
drawCoyote:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	add	r1, r1, #76
	bne	.L643
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L644
.L643:
	push	{r4, lr}
	ldr	r2, [r0]
	ldr	r3, [r0, #36]
	ldr	r4, [r0, #44]
	ldr	ip, .L649
	lsl	r2, r2, #23
	add	r3, r3, #5
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	add	r3, r3, r4, lsl #5
	lsr	r2, r2, #23
	lsl	r0, r1, #3
	orr	r2, r2, #16384
	add	r1, ip, r1, lsl #3
	lsl	r3, r3, #1
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L644:
	mov	r2, #512
	ldr	r3, .L649
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L650:
	.align	2
.L649:
	.word	shadowOAM
	.size	drawCoyote, .-drawCoyote
	.align	2
	.global	drawCarrot
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCarrot, %function
drawCarrot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	r3, r1
	bne	drawCarrot.part.0
.L652:
	mov	r2, #512
	ldr	r1, .L653
	add	r1, r1, r3, lsl #3
	strh	r2, [r1, #160]	@ movhi
	bx	lr
.L654:
	.align	2
.L653:
	.word	shadowOAM
	.size	drawCarrot, .-drawCarrot
	.align	2
	.global	drawShoe
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShoe, %function
drawShoe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	add	r1, r1, #44
	bne	.L656
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L657
.L656:
	add	r3, r0, #24
	ldr	r2, [r0]
	str	lr, [sp, #-4]!
	ldm	r3, {r3, lr}
	ldr	ip, .L662
	add	r3, r3, lr, lsl #5
	lsl	r2, r2, #23
	ldrb	lr, [r0, #4]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r3, r3, #512
	lsl	r0, r1, #3
	orr	r2, r2, #16384
	add	r1, ip, r1, lsl #3
	add	r3, r3, #2
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L657:
	mov	r2, #512
	ldr	r3, .L662
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L663:
	.align	2
.L662:
	.word	shadowOAM
	.size	drawShoe, .-drawShoe
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L684
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, [r1, #36]
	ldr	r3, [r1]
	ldr	r2, [r1, #28]
	ldr	r6, .L684+4
	add	r2, r2, r0, lsl #5
	lsl	r3, r3, #23
	ldr	r0, [r6]
	ldr	r7, .L684+8
	ldrb	r1, [r1, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	cmp	r0, #0
	strh	r3, [r7, #2]	@ movhi
	strh	r1, [r7]	@ movhi
	strh	r2, [r7, #4]	@ movhi
	ble	.L670
	mov	r4, #0
	mov	r8, #512
	ldr	r5, .L684+12
	b	.L669
.L683:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L667
	mov	r0, r5
	bl	drawBunny.part.0
	ldr	r3, [r6]
	cmp	r3, r4
	add	r5, r5, #44
	ble	.L670
.L669:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	mov	r1, r4
	add	r4, r4, #1
	bne	.L683
.L667:
	lsl	r3, r4, #3
	strh	r8, [r7, r3]	@ movhi
	ldr	r3, [r6]
	cmp	r3, r4
	add	r5, r5, #44
	bgt	.L669
.L670:
	mov	r4, #0
	ldr	r5, .L684+16
.L666:
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	bl	drawCoyote
	cmp	r4, #8
	add	r5, r5, #56
	bne	.L666
	mov	r4, #0
	mov	r7, #512
	ldr	r5, .L684+20
	ldr	r6, .L684+24
.L673:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	lsleq	r3, r4, #3
	strheq	r7, [r3, r6]	@ movhi
	movne	r1, r4
	movne	r0, r5
	blne	drawCarrot.part.0
.L672:
	add	r4, r4, #1
	cmp	r4, #10
	add	r5, r5, #32
	bne	.L673
	mov	r5, #0
	ldr	r4, .L684+28
	add	r6, r4, #800
.L674:
	mov	r1, r5
	mov	r0, r4
	add	r4, r4, #40
	bl	drawShoe
	cmp	r4, r6
	add	r5, r5, #1
	bne	.L674
	ldr	ip, .L684+32
	mov	r5, ip
	mov	r1, ip
	ldr	r2, .L684+36
	ldr	r3, [r2, #20]
	ldr	r6, [r2, #16]
	add	r3, r3, #20
	add	r6, r6, r3, lsl #5
	strh	r6, [ip, #4]	@ movhi
	ldm	r2, {r6, r7}
	orr	r2, r7, #16384
	strh	r2, [ip]	@ movhi
	mov	r4, ip
	ldr	r2, .L684+40
	ldr	r3, .L684+44
	orr	r6, r6, r2
	strh	r6, [ip, #2]	@ movhi
	ldr	r6, [r3, #4]
	mov	lr, ip
	orr	r6, r6, #16384
	strh	r6, [r5, #8]!	@ movhi
	ldr	r6, [r3]
	orr	r6, r6, r2
	strh	r6, [r5, #2]	@ movhi
	add	r5, r3, #16
	ldm	r5, {r5, r6}
	mov	r0, ip
	add	r3, r6, #18
	add	r5, r5, r3, lsl #5
	ldr	r3, .L684+48
	strh	r5, [ip, #12]	@ movhi
	ldr	r5, [r3]
	orr	r5, r5, r2
	ldr	r2, [r3, #4]
	orr	r2, r2, #16384
	strh	r2, [r1, #16]!	@ movhi
	strh	r5, [r1, #2]	@ movhi
	ldr	r1, [r3, #20]
	ldr	r5, [r3, #16]
	ldr	r2, .L684+52
	add	r3, r1, #22
	add	r5, r5, r3, lsl #5
	ldr	r3, [r2, #28]
	add	r1, r3, #24
	ldr	r3, [r2, #20]
	add	r3, r3, r1, lsl #4
	ldr	r1, [r2, #4]
	ldr	r2, [r2]
	strh	r5, [ip, #20]	@ movhi
	strh	r1, [r4, #24]!	@ movhi
	ldr	r1, .L684+56
	orr	r2, r2, #16384
	strh	r2, [r4, #2]	@ movhi
	lsl	r3, r3, #1
	ldr	r2, [r1, #4]
	strh	r3, [ip, #28]	@ movhi
	ldr	r3, [r1]
	strh	r2, [lr, #32]!	@ movhi
	orr	r3, r3, #16384
	strh	r3, [lr, #2]	@ movhi
	ldr	lr, [r1, #28]
	ldr	r3, [r1, #20]
	ldr	r2, .L684+60
	add	lr, lr, #24
	add	r3, r3, lr, lsl #4
	ldr	r1, [r2, #28]
	lsl	r3, r3, #1
	ldr	lr, [r2, #20]
	strh	r3, [ip, #36]	@ movhi
	ldm	r2, {r2, r3}
	add	r1, r1, #24
	strh	r3, [r0, #40]!	@ movhi
	add	lr, lr, r1, lsl #4
	lsl	lr, lr, #1
	orr	r2, r2, #16384
	strh	r2, [r0, #2]	@ movhi
	ldr	r4, .L684+64
	strh	lr, [ip, #44]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	sub	r1, ip, #560
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L685:
	.align	2
.L684:
	.word	player
	.word	bunniesNum
	.word	shadowOAM
	.word	bunnies
	.word	coyotes
	.word	carrots
	.word	shadowOAM+160
	.word	shoes
	.word	shadowOAM+560
	.word	bunniesText
	.word	-32768
	.word	carrotsText
	.word	shoesText
	.word	countTextBunnies
	.word	countTextCarrots
	.word	countTextShoes
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	drawBunniesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBunniesText, %function
drawBunniesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L688
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #20]
	ldr	r0, [r1, #4]
	ldr	r2, .L688+4
	ldr	r1, [r1, #16]
	add	ip, ip, #20
	str	lr, [sp, #-4]!
	orr	r0, r0, #16384
	add	lr, r2, #560
	add	r1, r1, ip, lsl #5
	add	r2, r2, #564
	strh	r3, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L689:
	.align	2
.L688:
	.word	bunniesText
	.word	shadowOAM
	.size	drawBunniesText, .-drawBunniesText
	.align	2
	.global	drawCarrotsText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCarrotsText, %function
drawCarrotsText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L692
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #20]
	ldr	r0, [r1, #4]
	ldr	r2, .L692+4
	ldr	r1, [r1, #16]
	add	ip, ip, #18
	str	lr, [sp, #-4]!
	orr	r0, r0, #16384
	add	lr, r2, #568
	add	r1, r1, ip, lsl #5
	add	r2, r2, #572
	strh	r3, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L693:
	.align	2
.L692:
	.word	carrotsText
	.word	shadowOAM
	.size	drawCarrotsText, .-drawCarrotsText
	.align	2
	.global	drawShoesText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShoesText, %function
drawShoesText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L696
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #20]
	ldr	r0, [r1, #4]
	ldr	r2, .L696+4
	ldr	r1, [r1, #16]
	add	ip, ip, #22
	str	lr, [sp, #-4]!
	orr	r0, r0, #16384
	add	lr, r2, #576
	add	r1, r1, ip, lsl #5
	add	r2, r2, #580
	strh	r3, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L697:
	.align	2
.L696:
	.word	shoesText
	.word	shadowOAM
	.size	drawShoesText, .-drawShoesText
	.align	2
	.global	drawCountBunnies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCountBunnies, %function
drawCountBunnies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L700
	ldr	ip, [r1, #28]
	ldr	r2, [r1, #20]
	ldr	r0, [r1]
	ldr	r3, .L700+4
	add	ip, ip, #24
	add	r2, r2, ip, lsl #4
	ldr	ip, [r1, #4]
	str	lr, [sp, #-4]!
	lsl	r2, r2, #1
	add	lr, r3, #588
	orr	r1, r0, #16384
	add	r3, r3, #584
	strh	r2, [lr]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L701:
	.align	2
.L700:
	.word	countTextBunnies
	.word	shadowOAM
	.size	drawCountBunnies, .-drawCountBunnies
	.align	2
	.global	drawCountCarrots
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCountCarrots, %function
drawCountCarrots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L704
	ldr	ip, [r1, #28]
	ldr	r2, [r1, #20]
	ldr	r0, [r1]
	ldr	r3, .L704+4
	add	ip, ip, #24
	add	r2, r2, ip, lsl #4
	ldr	ip, [r1, #4]
	str	lr, [sp, #-4]!
	lsl	r2, r2, #1
	add	lr, r3, #596
	orr	r1, r0, #16384
	add	r3, r3, #592
	strh	r2, [lr]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L705:
	.align	2
.L704:
	.word	countTextCarrots
	.word	shadowOAM
	.size	drawCountCarrots, .-drawCountCarrots
	.align	2
	.global	drawCountShoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCountShoes, %function
drawCountShoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L708
	ldr	ip, [r1, #28]
	ldr	r2, [r1, #20]
	ldr	r0, [r1]
	ldr	r3, .L708+4
	add	ip, ip, #24
	add	r2, r2, ip, lsl #4
	ldr	ip, [r1, #4]
	str	lr, [sp, #-4]!
	lsl	r2, r2, #1
	add	lr, r3, #604
	orr	r1, r0, #16384
	add	r3, r3, #600
	strh	r2, [lr]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L709:
	.align	2
.L708:
	.word	countTextShoes
	.word	shadowOAM
	.size	drawCountShoes, .-drawCountShoes
	.comm	cheatOn,4,4
	.comm	level,4,4
	.comm	count2,4,4
	.comm	count,4,4
	.comm	time,4,4
	.comm	bunniesToBeFed,4,4
	.comm	bunniesNum,4,4
	.comm	shoesSpawned,4,4
	.comm	shoesCollected,4,4
	.comm	carrotsCollected,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	countTextShoes,36,4
	.comm	countTextCarrots,36,4
	.comm	countTextBunnies,36,4
	.comm	shoesText,28,4
	.comm	carrotsText,28,4
	.comm	bunniesText,28,4
	.comm	shoes,800,4
	.comm	carrots,320,4
	.comm	coyotes,448,4
	.comm	bunnies,396,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
