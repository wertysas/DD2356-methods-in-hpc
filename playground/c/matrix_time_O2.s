	.file	"matrix_time.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu matrix_time.c
# -mtune=generic -march=x86-64 -auxbase-strip matrix_time_O2.s -O2
# -fverbose-asm -fasynchronous-unwind-tables -fstack-protector-strong
# -Wformat -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-reference-addressable
# -fipa-sra -fipa-stack-alignment -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-clash-protection
# -fstack-protector-strong -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.p2align 4
	.globl	matrix_matrix_mul
	.type	matrix_matrix_mul, @function
matrix_matrix_mul:
.LFB39:
	.cfi_startproc
	endbr64	
# matrix_time.c:12: void matrix_matrix_mul(double** A, double** B, double** C) {
	movq	%rdi, %r11	# tmp101, A
	movq	%rdx, %r10	# tmp103, C
	movq	%rsi, %rdi	# tmp102, B
# matrix_time.c:16:          C[i][j] += A[i][k] * B[k][j];
	xorl	%r9d, %r9d	# ivtmp.29
.L2:
	movq	(%r11,%r9), %r8	# MEM[base: A_31(D), index: ivtmp.29_62, offset: 0B], _10
	movq	(%r10,%r9), %rsi	# MEM[base: C_30(D), index: ivtmp.29_62, offset: 0B], ivtmp.19
	xorl	%ecx, %ecx	# ivtmp.20
.L6:
	movsd	(%rsi), %xmm1	# MEM[base: _64, offset: 0B], _20
# matrix_time.c:12: void matrix_matrix_mul(double** A, double** B, double** C) {
	xorl	%eax, %eax	# ivtmp.11
	.p2align 4,,10
	.p2align 3
.L3:
# matrix_time.c:16:          C[i][j] += A[i][k] * B[k][j];
	movq	(%rdi,%rax), %rdx	# MEM[base: B_32(D), index: ivtmp.11_71, offset: 0B], MEM[base: B_32(D), index: ivtmp.11_71, offset: 0B]
# matrix_time.c:16:          C[i][j] += A[i][k] * B[k][j];
	movsd	(%rdx,%rcx), %xmm0	# *_17, *_17
	mulsd	(%r8,%rax), %xmm0	# MEM[base: _10, index: ivtmp.11_71, offset: 0B], tmp99
	addq	$8, %rax	#, ivtmp.11
# matrix_time.c:16:          C[i][j] += A[i][k] * B[k][j];
	addsd	%xmm0, %xmm1	# tmp99, _20
	movsd	%xmm1, (%rsi)	# _20, MEM[base: _64, offset: 0B]
# matrix_time.c:15:       for (uint k=0; k<n; k++) {
	cmpq	$8192, %rax	#, ivtmp.11
	jne	.L3	#,
	addq	$8, %rcx	#, ivtmp.20
	addq	$8, %rsi	#, ivtmp.19
# matrix_time.c:14:     for (uint j=0; j<n; j++) {
	cmpq	$8192, %rcx	#, ivtmp.20
	jne	.L6	#,
	addq	$8, %r9	#, ivtmp.29
# matrix_time.c:13:   for (uint i=0; i<n; i++) {
	cmpq	$8192, %r9	#, ivtmp.29
	jne	.L2	#,
# matrix_time.c:20: }
	ret	
	.cfi_endproc
.LFE39:
	.size	matrix_matrix_mul, .-matrix_matrix_mul
	.comm	C,8388608,32
	.comm	B,8388608,32
	.comm	A,8388608,32
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
