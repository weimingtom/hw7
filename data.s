	.file	"data.c"
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
	.global	readSwitch
	.type	readSwitch, %function
readSwitch:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L16
	ldr	r1, [r3, #0]	@  buttons
	ldr	lr, .L16+4
	mov	ip, r0	@  num
	ldrh	r0, [r1, #0]
	mov	r3, #1
	ldr	r2, [lr, ip, asl #2]	@  sw_state
	ands	r3, r0, r3, asl ip
	movne	r3, #0	@  isOn
	moveq	r3, #1	@  isOn
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L2
	.p2align 2
.L13:
	.word	.L3
	.word	.L10
	.word	.L8
	.word	.L10
.L3:
	cmp	r3, #0	@  isOn
	movne	r3, #1
	bne	.L11
.L2:
	ldr	r0, [lr, ip, asl #2]	@  num,  sw_state
	ldr	lr, [sp], #4
	bx	lr
.L11:
	str	r3, [lr, ip, asl #2]	@  isOn,  sw_state
	b	.L2
.L8:
	cmp	r3, #0	@  isOn
	moveq	r3, #3
	beq	.L11
	b	.L2
.L10:
	cmp	r3, #0	@  isOn
	movne	r3, #2
	b	.L11
.L17:
	.align	2
.L16:
	.word	buttons
	.word	sw_state
	.size	readSwitch, .-readSwitch
	.ident	"GCC: (GNU) 3.3.2"
