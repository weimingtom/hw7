	.file	"main.c"
@ GNU C version 3.3.2 (arm-thumb-elf)
@	compiled by GNU C version 3.3.1 (cygming special).
@ GGC heuristics: --param ggc-min-expand=82 --param ggc-min-heapsize=98246
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls
@ -auxbase-strip -O2 -Wall -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -floop-optimize
@ -fcrossjumping -fif-conversion -fif-conversion2 -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -freorder-functions -fcprop-registers -fcommon
@ -fverbose-asm -fgnu-linker -fregmove -foptimize-register-move
@ -fargument-alias -fstrict-aliasing -fmerge-constants
@ -fzero-initialized-in-bss -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	scanLineCounter
	.data
	.align	2
	.type	scanLineCounter, %object
	.size	scanLineCounter, 4
scanLineCounter:
	.word	67108870
	.global	screenbase
	.align	2
	.type	screenbase, %object
	.size	screenbase, 4
screenbase:
	.word	100663296
	.global	charbase
	.align	2
	.type	charbase, %object
	.size	charbase, 4
charbase:
	.word	100663296
	.global	buttons
	.align	2
	.type	buttons, %object
	.size	buttons, 4
buttons:
	.word	67109168
	.global	sw_state
	.bss
	.global	sw_state
	.align	2
	.type	sw_state, %object
	.size	sw_state, 40
sw_state:
	.space	40
	.global	videoBuffer
	.data
	.align	2
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.global	FrontBuffer
	.align	2
	.type	FrontBuffer, %object
	.size	FrontBuffer, 4
FrontBuffer:
	.word	100663296
	.global	BackBuffer
	.align	2
	.type	BackBuffer, %object
	.size	BackBuffer, 4
BackBuffer:
	.word	100704256
	.global	spriteTiles
	.align	2
	.type	spriteTiles, %object
	.size	spriteTiles, 4
spriteTiles:
	.word	spritesTiles
	.global	spritePalette
	.align	2
	.type	spritePalette, %object
	.size	spritePalette, 4
spritePalette:
	.word	spritesPal
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mvn	r3, #29952
	mov	r2, #67108864
	sub	fp, ip, #4
	sub	r3, r3, #247
	sub	sp, sp, #4
	mvn	r1, #29440
	mov	r0, #2048	@ movhi
	mov	lr, #0	@ movhi
	strh	r0, [r2, #8]	@ movhi 
	sub	r1, r1, #243
	strh	r3, [r2, #10]	@ movhi 
	mov	r3, #1792	@ movhi
	strh	r1, [r2, #12]	@ movhi 
	ldr	r9, .L59
	strh	lr, [r2, #16]	@ movhi 
	ldr	sl, .L59+4
	strh	lr, [r2, #18]	@ movhi 
	ldr	r7, .L59+8
	strh	lr, [r2, #20]	@ movhi 
	ldr	r8, .L59+12
	strh	lr, [r2, #22]	@ movhi 
	ldr	r6, .L59+16
	strh	lr, [r2, #24]	@ movhi 
	ldr	r4, .L59+20
	ldr	r5, .L59+24
	strh	r3, [r2, #0]	@ movhi 
	strh	lr, [r2, #26]	@ movhi 
	mov	ip, #0	@  hoff
.L44:
	mov	r1, #0	@  i
.L9:
	mov	r2, r1, asl #1	@  i
	add	r3, r2, #83886080
	add	r1, r1, #1	@  i,  i
	ldrh	r2, [r2, r9]	@ movhi	@  background0Pal
	cmp	r1, #255	@  i
	strh	r2, [r3, #0]	@ movhi 
	ble	.L9
	ldr	r0, .L59+28
	ldr	r3, [r0, #0]	@  charbase
	mov	r0, #604
	add	r2, r3, #49152
	mov	r1, #0	@  i
	add	r0, r0, #3
.L14:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, sl]	@ movhi	@  background0Tiles
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tileimg
	ble	.L14
	ldr	r2, .L59+32
	ldr	r3, [r2, #0]	@  screenbase
	mov	r0, #1020
	add	r2, r3, #24576
	mov	r1, #0	@  i
	add	r0, r0, #3
.L19:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, r7]	@ movhi	@  background0Map
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tilemap
	ble	.L19
	ldr	lr, .L59+28
	ldr	r3, [lr, #0]	@  charbase
	mov	r0, #876
	add	r2, r3, #32768
	mov	r1, #0	@  i
	add	r0, r0, #3
.L24:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, r8]	@ movhi	@  background1Tiles
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tileimg
	ble	.L24
	ldr	r0, .L59+32
	ldr	r3, [r0, #0]	@  screenbase
	mov	r0, #1020
	add	r2, r3, #20480
	mov	r1, #0	@  i
	add	r0, r0, #3
.L29:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, r6]	@ movhi	@  background1Map
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tilemap
	ble	.L29
	ldr	r3, .L59+28
	mov	r0, #1168
	ldr	r2, [r3, #0]	@  charbase
	mov	r1, #0	@  i
	add	r0, r0, #15
.L34:
	mov	r3, r1, asl #1	@  i
	ldrh	lr, [r3, r4]	@ movhi	@  background2Tiles
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	lr, [r3, r2]	@ movhi 	@  <variable>.tileimg
	ble	.L34
	ldr	r0, .L59+32
	ldr	r3, [r0, #0]	@  screenbase
	mov	r0, #1020
	add	r2, r3, #16384
	mov	r1, #0	@  i
	add	r0, r0, #3
.L39:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, r5]	@ movhi	@  background2Map
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tilemap
	ble	.L39
	ldr	r2, .L59+36
	ldr	r0, [r2, #0]	@  buttons
	ldrh	r3, [r0, #0]
	mvn	r3, r3
	tst	r3, #32
	ldrh	r3, [r0, #0]
	mvn	r3, r3
	subne	ip, ip, #3	@  hoff,  hoff
	tst	r3, #16
	ldr	r3, .L59+40
	addne	ip, ip, #3	@  hoff,  hoff
	smull	lr, r1, r3, ip	@  hoff
	mov	r2, ip, asr #31	@  hoff
	rsb	r2, r2, r1, asr #3
	mov	r3, #67108864
	ldrh	r1, [r0, #0]
	str	ip, [fp, #-44]
	ldrh	r0, [r0, #0]
	strh	ip, [r3, #16]	@ movhi 	@  hoff
	ldr	r0, .L59+44
	strh	r2, [r3, #20]	@ movhi 
	mov	lr, pc
	bx	r0
	ldr	ip, [fp, #-44]
	b	.L44
.L60:
	.align	2
.L59:
	.word	background0Pal
	.word	background0Tiles
	.word	background0Map
	.word	background1Tiles
	.word	background1Map
	.word	background2Tiles
	.word	background2Map
	.word	charbase
	.word	screenbase
	.word	buttons
	.word	1717986919
	.word	waitForVBlank
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
