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
	.global	backColor
	.align	2
	.type	backColor, %object
	.size	backColor, 20
backColor:
	.word	31
	.word	32736
	.word	32224
	.word	31775
	.word	31759
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	mov	r3, #67108864
	mov	r6, #0	@  voff
	strh	r6, [r3, #24]	@ movhi 	@  voff
	mov	r7, #2576
	strh	r6, [r3, #26]	@ movhi 	@  voff
	ldr	r9, .L31
	ldr	r4, .L31+4
	ldr	r5, .L31+8
	sub	fp, ip, #4
	mov	sl, r6	@  hoff,  voff
	add	r7, r7, #15
.L24:
	ldr	r0, .L31+12
	ldr	r2, [r0, #0]	@  charbase
	mov	r1, #0	@  i
.L9:
	mov	r3, r1, asl #1	@  i
	ldrh	r0, [r3, r9]	@ movhi	@  backgroundTiles
	add	r1, r1, #1	@  i,  i
	cmp	r1, r7	@  i
	strh	r0, [r3, r2]	@ movhi 	@  <variable>.tileimg
	ble	.L9
	ldr	r2, .L31+16
	ldr	r3, [r2, #0]	@  screenbase
	mov	r0, #1020
	add	r2, r3, #63488
	mov	r1, #0	@  i
	add	r0, r0, #3
.L14:
	mov	r3, r1, asl #1	@  i
	ldrh	r3, [r3, r4]	@ movhi	@  backgroundMap
	add	r1, r1, #1	@  i,  i
	cmp	r1, r0	@  i
	strh	r3, [r2], #2	@ movhi 	@  <variable>.tilemap
	ble	.L14
	mov	r1, #0	@  i
.L19:
	mov	r2, r1, asl #1	@  i
	add	r3, r2, #83886080
	add	r1, r1, #1	@  i,  i
	ldrh	r2, [r2, r5]	@ movhi	@  backgroundPal
	cmp	r1, #255	@  i
	strh	r2, [r3, #0]	@ movhi 
	ble	.L19
	ldr	r3, .L31+20
	mov	r8, #67108864
	ldr	r2, [r3, #0]	@  buttons
	mov	r0, #8064	@ movhi
	mov	r3, #1024	@ movhi
	strh	r0, [r8, #12]	@ movhi 
	strh	r3, [r8, #0]	@ movhi 
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	tst	r3, #32
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	subne	sl, sl, #2	@  hoff,  hoff
	tst	r3, #16
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	addne	sl, sl, #2	@  hoff,  hoff
	tst	r3, #64
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	subne	r6, r6, #2	@  voff,  voff
	ldr	r0, .L31+24
	tst	r3, #128
	addne	r6, r6, #2	@  voff,  voff
	mov	lr, pc
	bx	r0
	strh	sl, [r8, #24]	@ movhi 	@  hoff
	strh	r6, [r8, #26]	@ movhi 	@  voff
	b	.L24
.L32:
	.align	2
.L31:
	.word	backgroundTiles
	.word	backgroundMap
	.word	backgroundPal
	.word	charbase
	.word	screenbase
	.word	buttons
	.word	waitForVBlank
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.2"
