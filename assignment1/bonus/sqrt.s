	.file	"measure_sqrt.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu measure_sqrt.c
# -mtune=generic -march=x86-64 -auxbase-strip sqrt.s -O2 -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"x = sqrt(x) execution time: %11.8f (s)\t average over %d iterations"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	$10000, %ebx	#, ivtmp_4
	subq	$64, %rsp	#,
	.cfi_def_cfa_offset 96
# measure_sqrt.c:9: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp123
	movq	%rax, 56(%rsp)	# tmp123, D.3683
	xorl	%eax, %eax	# tmp123
# measure_sqrt.c:27:   i = gettimeofday(&tp, &tzp);
	leaq	24(%rsp), %r12	#, tmp119
	leaq	32(%rsp), %rbp	#, tmp120
	movq	%r12, %rsi	# tmp119,
	movq	%rbp, %rdi	# tmp120,
	call	gettimeofday@PLT	#
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp103
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp106
	pxor	%xmm2, %xmm2	# tmp122
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	40(%rsp), %xmm0	# tp.tv_usec, tmp103
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC1(%rip), %xmm0	#, tmp104
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	32(%rsp), %xmm1	# tp.tv_sec, tmp106
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp106, tmp104
	movsd	%xmm0, (%rsp)	# tmp104, %sfp
# measure_sqrt.c:13:     x = sqrt(x);
	movsd	.LC0(%rip), %xmm0	#, x
	jmp	.L2	#
	.p2align 4,,10
	.p2align 3
.L4:
	ucomisd	%xmm0, %xmm2	# x, tmp122
# measure_sqrt.c:13:     x = sqrt(x);
	movapd	%xmm0, %xmm1	# x, x
	sqrtsd	%xmm1, %xmm1	# x, x
	ja	.L8	#,
.L3:
	movapd	%xmm1, %xmm0	# x, x
.L2:
# measure_sqrt.c:12:   for (int i=0; i<N; i++) {
	subl	$1, %ebx	#, ivtmp_4
	jne	.L4	#,
# measure_sqrt.c:27:   i = gettimeofday(&tp, &tzp);
	movq	%r12, %rsi	# tmp119,
	movq	%rbp, %rdi	# tmp120,
	call	gettimeofday@PLT	#
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp110
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp113
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$10000, %edx	#,
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	40(%rsp), %xmm0	# tp.tv_usec, tmp110
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$1, %eax	#,
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC1(%rip), %xmm0	#, tmp111
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	32(%rsp), %xmm1	# tp.tv_sec, tmp113
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC4(%rip), %rsi	#,
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp113, _21
# measure_sqrt.c:17:       (t2-t1)/((double)N), N);
	subsd	(%rsp), %xmm0	# %sfp, tmp114
# measure_sqrt.c:16:   printf("x = sqrt(x) execution time: %11.8f (s)\t average over %d iterations",
	divsd	.LC3(%rip), %xmm0	#, tmp115
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# measure_sqrt.c:20: }
	movq	56(%rsp), %rax	# D.3683, tmp124
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp124
	jne	.L9	#,
	addq	$64, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L8:
	.cfi_restore_state
	movsd	%xmm1, 8(%rsp)	# x, %sfp
# measure_sqrt.c:13:     x = sqrt(x);
	call	sqrt@PLT	#
	movsd	8(%rsp), %xmm1	# %sfp, x
	pxor	%xmm2, %xmm2	# tmp122
	jmp	.L3	#
.L9:
# measure_sqrt.c:20: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.text
	.p2align 4
	.globl	mysecond
	.type	mysecond, @function
mysecond:
.LFB24:
	.cfi_startproc
	endbr64	
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 64
# measure_sqrt.c:22: double mysecond() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	movq	%rax, 40(%rsp)	# tmp97, D.3689
	xorl	%eax, %eax	# tmp97
# measure_sqrt.c:27:   i = gettimeofday(&tp, &tzp);
	leaq	8(%rsp), %rsi	#, tmp89
	leaq	16(%rsp), %rdi	#, tmp90
	call	gettimeofday@PLT	#
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp91
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp94
# measure_sqrt.c:29: }
	movq	40(%rsp), %rax	# D.3689, tmp98
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	24(%rsp), %xmm0	# tp.tv_usec, tmp91
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC1(%rip), %xmm0	#, tmp92
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	16(%rsp), %xmm1	# tp.tv_sec, tmp94
# measure_sqrt.c:28:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp94, <retval>
# measure_sqrt.c:29: }
	jne	.L13	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE24:
	.size	mysecond, .-mysecond
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1473681892
	.long	1073948400
	.align 8
.LC1:
	.long	2696277389
	.long	1051772663
	.align 8
.LC3:
	.long	0
	.long	1086556160
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
