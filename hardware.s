	.file	"hardware.c"
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

	.text
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L8
	@ lr needed for prologue
.L2:
	ldr	r2, [r1, #0]	@  scanLineCounter
	ldrh	r3, [r2, #0]
	cmp	r3, #159
	bhi	.L2
.L5:
	ldrh	r3, [r2, #0]
	cmp	r3, #159
	bls	.L5
	bx	lr
.L9:
	.align	2
.L8:
	.word	scanLineCounter
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	rectangleDMA
	.type	rectangleDMA, %function
rectangleDMA:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #4
	mov	r5, r3	@  h
	mov	ip, #0	@  r
	ldr	r3, [sp, #16]	@  color
	cmp	ip, r5	@  r,  h
	strh	r3, [sp, #2]	@ movhi 	@  color
	mov	r4, r2	@  w
	bge	.L18
	ldr	r2, .L19
	rsb	r3, r1, r1, asl #4	@  y,  y
	ldr	r1, [r2, #0]	@  videoBuffer
	add	r3, r0, r3, asl #4	@  x
	add	r0, r1, r3, asl #1
	mov	lr, ip	@  r,  r
	orr	r2, r4, #-2130706432	@  w
	mov	ip, r5	@  r,  h
	add	r1, sp, #2
	mov	r3, #67108864
.L16:
	subs	ip, ip, #1	@  r,  r
	str	lr, [r3, #220]	@  r
	str	r1, [r3, #212]
	str	r0, [r3, #216]
	str	r2, [r3, #220]
	add	r0, r0, #480
	bne	.L16
.L18:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	videoBuffer
	.size	rectangleDMA, .-rectangleDMA
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L31
	@ lr needed for prologue
.L22:
	ldr	r2, [r1, #0]	@  buttons
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	tst	r3, #8
	bne	.L22
.L25:
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	tst	r3, #8
	beq	.L25
	ldr	r2, [r1, #0]	@  buttons
.L28:
	ldrh	r3, [r2, #0]
	mvn	r3, r3
	tst	r3, #8
	bne	.L28
	bx	lr
.L32:
	.align	2
.L31:
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	fillScreen
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L35
	sub	sp, sp, #4
	add	r1, sp, #4
	strh	r0, [r1, #-2]!	@ movhi 	@  color
	ldr	ip, [r3, #0]	@  videoBuffer
	mov	r0, #-2130706432
	mov	r2, #67108864
	add	r0, r0, #38400
	mov	r3, #0
	str	r3, [r2, #220]
	@ lr needed for prologue
	str	r1, [r2, #212]
	str	ip, [r2, #216]
	str	r0, [r2, #220]
	add	sp, sp, #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	videoBuffer
	.size	fillScreen, .-fillScreen
	.ident	"GCC: (GNU) 3.3.2"
