	.file	"nbody.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.1) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu nbody.c -mtune=generic
# -march=x86-64 -auxbase-strip nbody.s -O2 -fverbose-asm
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
	.p2align 4
	.globl	update_forces_simple
	.type	update_forces_simple, @function
update_forces_simple:
.LFB53:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm5, %xmm5	# tmp157
# nbody.c:96:     for (uint j = 0; j != i && j < N; j++) {
	xorl	%r15d, %r15d	# ivtmp.23
# nbody.c:94: void update_forces_simple(vect_t *forces, vect_t *positions, double *masses) {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14	# masses, ivtmp.28
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13	# positions, ivtmp.29
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp	# tmp159, ivtmp.27
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	movsd	.LC1(%rip), %xmm4	#, tmp158
	.p2align 4,,10
	.p2align 3
.L2:
# nbody.c:96:     for (uint j = 0; j != i && j < N; j++) {
	xorl	%ebx, %ebx	# j
# nbody.c:96:     for (uint j = 0; j != i && j < N; j++) {
	testl	%r15d, %r15d	# ivtmp.23
	je	.L7	#,
	.p2align 4,,10
	.p2align 3
.L4:
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	movl	%ebx, %r12d	# j, _5
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	movsd	0(%r13), %xmm1	# MEM[base: _114, offset: 0B], MEM[base: _114, offset: 0B]
# nbody.c:99:       y_diff = positions[i][1] - positions[j][1];
	movsd	8(%r13), %xmm0	# MEM[base: _114, offset: 8B], MEM[base: _114, offset: 8B]
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	movq	%r12, %rax	# _5, tmp129
	salq	$4, %rax	#, tmp129
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	movapd	%xmm1, %xmm3	# MEM[base: _114, offset: 0B], MEM[base: _114, offset: 0B]
# nbody.c:99:       y_diff = positions[i][1] - positions[j][1];
	movapd	%xmm0, %xmm2	# MEM[base: _114, offset: 8B], MEM[base: _114, offset: 8B]
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	addq	%rsi, %rax	# positions, _7
# nbody.c:98:       x_diff = positions[i][0] - positions[j][0];
	subsd	(%rax), %xmm3	# *_7, MEM[base: _114, offset: 0B]
# nbody.c:99:       y_diff = positions[i][1] - positions[j][1];
	subsd	8(%rax), %xmm2	# *_7, MEM[base: _114, offset: 8B]
# nbody.c:100:       dist = sqrt(x_diff * x_diff + y_diff * y_diff);
	movapd	%xmm3, %xmm0	# x_diff, tmp132
# nbody.c:100:       dist = sqrt(x_diff * x_diff + y_diff * y_diff);
	movapd	%xmm2, %xmm1	# y_diff, tmp133
	mulsd	%xmm2, %xmm1	# y_diff, tmp133
# nbody.c:100:       dist = sqrt(x_diff * x_diff + y_diff * y_diff);
	mulsd	%xmm3, %xmm0	# x_diff, tmp132
# nbody.c:100:       dist = sqrt(x_diff * x_diff + y_diff * y_diff);
	addsd	%xmm1, %xmm0	# tmp133, _13
	ucomisd	%xmm0, %xmm5	# _13, tmp157
	movapd	%xmm0, %xmm1	# _13, dist
	sqrtsd	%xmm1, %xmm1	# dist, dist
	ja	.L17	#,
.L3:
# nbody.c:101:       dist_cubed = dist * dist * dist;
	movapd	%xmm1, %xmm6	# dist, tmp135
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	leaq	(%rdx,%r12,8), %rax	#, _22
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	movsd	0(%rbp), %xmm0	# MEM[base: _119, offset: 0B], MEM[base: _119, offset: 0B]
# nbody.c:96:     for (uint j = 0; j != i && j < N; j++) {
	addl	$1, %ebx	#, j
# nbody.c:101:       dist_cubed = dist * dist * dist;
	mulsd	%xmm1, %xmm6	# dist, tmp135
# nbody.c:101:       dist_cubed = dist * dist * dist;
	mulsd	%xmm1, %xmm6	# dist, dist_cubed
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	movsd	(%r14), %xmm1	# MEM[base: _117, offset: 0B], tmp137
	mulsd	%xmm4, %xmm1	# tmp158, tmp137
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	mulsd	(%rax), %xmm1	# *_22, tmp140
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	divsd	%xmm6, %xmm1	# dist_cubed, tmp141
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	mulsd	%xmm3, %xmm1	# x_diff, tmp142
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	subsd	%xmm1, %xmm0	# tmp142, tmp143
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	movsd	8(%rbp), %xmm1	# MEM[base: _119, offset: 8B], MEM[base: _119, offset: 8B]
# nbody.c:102:       forces[i][0] -= G * masses[i] * masses[j] / dist_cubed * x_diff;
	movsd	%xmm0, 0(%rbp)	# tmp143, MEM[base: _119, offset: 0B]
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	movsd	(%r14), %xmm0	# MEM[base: _117, offset: 0B], tmp145
	mulsd	%xmm4, %xmm0	# tmp158, tmp145
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	mulsd	(%rax), %xmm0	# *_22, tmp148
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	divsd	%xmm6, %xmm0	# dist_cubed, tmp149
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	mulsd	%xmm2, %xmm0	# y_diff, tmp150
# nbody.c:103:       forces[i][1] -= G * masses[i] * masses[j] / dist_cubed * y_diff;
	subsd	%xmm0, %xmm1	# tmp150, MEM[base: _119, offset: 8B]
	movsd	%xmm1, 8(%rbp)	# tmp151, MEM[base: _119, offset: 8B]
# nbody.c:96:     for (uint j = 0; j != i && j < N; j++) {
	cmpl	%ebx, %r15d	# j, ivtmp.23
	je	.L9	#,
	cmpl	$1999, %ebx	#, j
	jbe	.L4	#,
.L9:
# nbody.c:95:   for (uint i = 0; i < N; i++) {
	cmpl	$1999, %r15d	#, ivtmp.23
	je	.L1	#,
.L7:
	addl	$1, %r15d	#, ivtmp.23
	addq	$16, %rbp	#, ivtmp.27
	addq	$8, %r14	#, ivtmp.28
	addq	$16, %r13	#, ivtmp.29
	jmp	.L2	#
.L1:
# nbody.c:106: }
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L17:
	.cfi_restore_state
	movq	%rdx, 40(%rsp)	# masses, %sfp
	movq	%rsi, 32(%rsp)	# positions, %sfp
	movsd	%xmm1, 24(%rsp)	# dist, %sfp
	movsd	%xmm2, 16(%rsp)	# y_diff, %sfp
	movsd	%xmm3, 8(%rsp)	# x_diff, %sfp
# nbody.c:100:       dist = sqrt(x_diff * x_diff + y_diff * y_diff);
	call	sqrt@PLT	#
	movq	.LC1(%rip), %rax	#, tmp179
	movq	40(%rsp), %rdx	# %sfp, masses
	pxor	%xmm5, %xmm5	# tmp157
	movq	32(%rsp), %rsi	# %sfp, positions
	movsd	24(%rsp), %xmm1	# %sfp, dist
	movsd	16(%rsp), %xmm2	# %sfp, y_diff
	movsd	8(%rsp), %xmm3	# %sfp, x_diff
	movq	%rax, %xmm4	# tmp179, tmp158
	jmp	.L3	#
	.cfi_endproc
.LFE53:
	.size	update_forces_simple, .-update_forces_simple
	.p2align 4
	.globl	update_forces
	.type	update_forces, @function
update_forces:
.LFB54:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14	# tmp155, positions
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:71:   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
	xorl	%esi, %esi	#
# nbody.c:108: void update_forces(vect_t *forces, vect_t *positions, double *masses) {
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13	# tmp156, masses
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:71:   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
	movl	$32000, %edx	#,
# nbody.c:108: void update_forces(vect_t *forces, vect_t *positions, double *masses) {
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d	# _1
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
# nbody.c:111:     for (uint j = i + 1; j < N; j++) {
	movl	$1, %ebx	#, j
# nbody.c:108: void update_forces(vect_t *forces, vect_t *positions, double *masses) {
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:71:   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
	call	memset@PLT	#
# nbody.c:111:     for (uint j = i + 1; j < N; j++) {
	movl	$1, %edi	#, j
	pxor	%xmm4, %xmm4	# tmp152
	movsd	.LC1(%rip), %xmm3	#, tmp153
# /usr/include/x86_64-linux-gnu/bits/string_fortified.h:71:   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
	movq	%rax, %r15	# tmp157, tmp130
	.p2align 4,,10
	.p2align 3
.L19:
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	movq	%r12, %rdx	# _1, _2
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	movl	%ebx, %ebp	# j, _5
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	salq	$4, %rdx	#, _2
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	movq	%rbp, %rax	# _5, _6
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	leaq	(%r14,%rdx), %rsi	#, _3
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	salq	$4, %rax	#, _6
# nbody.c:115:       ydiff = positions[i][1] - positions[j][1];
	movsd	8(%rsi), %xmm0	# *_3, *_3
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	leaq	(%r14,%rax), %rcx	#, _7
# nbody.c:114:       xdiff = positions[i][0] - positions[j][0];
	movsd	(%rsi), %xmm1	# *_3, *_3
	subsd	(%rcx), %xmm1	# *_7, xdiff
# nbody.c:115:       ydiff = positions[i][1] - positions[j][1];
	movapd	%xmm0, %xmm2	# *_3, *_3
	subsd	8(%rcx), %xmm2	# *_7, *_3
# nbody.c:116:       dist = sqrt(xdiff * xdiff + ydiff * ydiff);
	movapd	%xmm1, %xmm0	# xdiff, tmp134
	mulsd	%xmm1, %xmm0	# xdiff, tmp134
# nbody.c:116:       dist = sqrt(xdiff * xdiff + ydiff * ydiff);
	movapd	%xmm2, %xmm5	# ydiff, tmp135
	mulsd	%xmm2, %xmm5	# ydiff, tmp135
# nbody.c:116:       dist = sqrt(xdiff * xdiff + ydiff * ydiff);
	addsd	%xmm5, %xmm0	# tmp135, _13
	ucomisd	%xmm0, %xmm4	# _13, tmp152
	movapd	%xmm0, %xmm6	# _13, dist
	sqrtsd	%xmm6, %xmm6	# dist, dist
	ja	.L26	#,
.L20:
# nbody.c:117:       dist_cubed = dist * dist * dist;
	movapd	%xmm6, %xmm5	# dist, tmp141
# nbody.c:120:       forces[i][0] += force_ij[0];
	addq	%r15, %rdx	# tmp130, _26
# nbody.c:122:       forces[j][0] -= force_ij[0];
	addq	%r15, %rax	# tmp130, _31
# nbody.c:111:     for (uint j = i + 1; j < N; j++) {
	addl	$1, %ebx	#, j
# nbody.c:117:       dist_cubed = dist * dist * dist;
	mulsd	%xmm6, %xmm5	# dist, tmp141
# nbody.c:118:       force_ij[0] = G * masses[i] * masses[j] / dist_cubed * xdiff;
	movsd	0(%r13,%r12,8), %xmm0	# *_16, tmp137
	mulsd	%xmm3, %xmm0	# tmp153, tmp137
# nbody.c:118:       force_ij[0] = G * masses[i] * masses[j] / dist_cubed * xdiff;
	mulsd	0(%r13,%rbp,8), %xmm0	# *_20, tmp140
# nbody.c:117:       dist_cubed = dist * dist * dist;
	mulsd	%xmm6, %xmm5	# dist, dist_cubed
# nbody.c:118:       force_ij[0] = G * masses[i] * masses[j] / dist_cubed * xdiff;
	divsd	%xmm5, %xmm0	# dist_cubed, _23
# nbody.c:118:       force_ij[0] = G * masses[i] * masses[j] / dist_cubed * xdiff;
	mulsd	%xmm0, %xmm1	# _23, _24
# nbody.c:119:       force_ij[1] = G * masses[i] * masses[j] / dist_cubed * ydiff;
	mulsd	%xmm2, %xmm0	# ydiff, _25
# nbody.c:120:       forces[i][0] += force_ij[0];
	movsd	(%rdx), %xmm2	# *_26, tmp143
	addsd	%xmm1, %xmm2	# _24, tmp143
	movsd	%xmm2, (%rdx)	# tmp143, *_26
# nbody.c:121:       forces[i][1] += force_ij[1];
	movsd	8(%rdx), %xmm2	# *_26, tmp145
	addsd	%xmm0, %xmm2	# _25, tmp145
	movsd	%xmm2, 8(%rdx)	# tmp145, *_26
# nbody.c:122:       forces[j][0] -= force_ij[0];
	movsd	(%rax), %xmm2	# *_31, *_31
	subsd	%xmm1, %xmm2	# _24, *_31
# nbody.c:123:       forces[j][1] -= force_ij[1];
	movsd	8(%rax), %xmm1	# *_31, *_31
	subsd	%xmm0, %xmm1	# _25, *_31
# nbody.c:122:       forces[j][0] -= force_ij[0];
	movsd	%xmm2, (%rax)	# tmp147, *_31
# nbody.c:123:       forces[j][1] -= force_ij[1];
	movsd	%xmm1, 8(%rax)	# tmp149, *_31
# nbody.c:111:     for (uint j = i + 1; j < N; j++) {
	cmpl	$2000, %ebx	#, j
	jne	.L19	#,
	leal	1(%rdi), %ebx	#, j
# nbody.c:111:     for (uint j = i + 1; j < N; j++) {
	cmpl	$1999, %edi	#, j
	je	.L27	#,
	movl	%edi, %r12d	# j,
	movl	%ebx, %edi	# j, j
	jmp	.L19	#
	.p2align 4,,10
	.p2align 3
.L27:
# nbody.c:126: }
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L26:
	.cfi_restore_state
	movl	%edi, 20(%rsp)	# j, %sfp
	movq	%rax, 8(%rsp)	# _6, %sfp
	movq	%rdx, (%rsp)	# _2, %sfp
	movsd	%xmm6, 40(%rsp)	# dist, %sfp
	movsd	%xmm2, 32(%rsp)	# ydiff, %sfp
	movsd	%xmm1, 24(%rsp)	# xdiff, %sfp
# nbody.c:116:       dist = sqrt(xdiff * xdiff + ydiff * ydiff);
	call	sqrt@PLT	#
	movq	.LC1(%rip), %rax	#, tmp178
	movl	20(%rsp), %edi	# %sfp, j
	pxor	%xmm4, %xmm4	# tmp152
	movsd	40(%rsp), %xmm6	# %sfp, dist
	movsd	32(%rsp), %xmm2	# %sfp, ydiff
	movq	%rax, %xmm3	# tmp178, tmp153
	movsd	24(%rsp), %xmm1	# %sfp, xdiff
	movq	8(%rsp), %rax	# %sfp, _6
	movq	(%rsp), %rdx	# %sfp, _2
	jmp	.L20	#
	.cfi_endproc
.LFE54:
	.size	update_forces, .-update_forces
	.p2align 4
	.globl	move_positions
	.type	move_positions, @function
move_positions:
.LFB55:
	.cfi_startproc
	endbr64	
	movsd	.LC2(%rip), %xmm1	#, tmp137
	leaq	8(%rsi), %rax	#, ivtmp.51
	leaq	8(%rdi), %rsi	#, ivtmp.53
	leaq	32000(%rdx), %rdi	#, _65
	.p2align 4,,10
	.p2align 3
.L29:
# nbody.c:131:     positions[i][0] += delta_t * velocities[i][0];
	movsd	(%rdx), %xmm0	# MEM[base: _58, offset: 0B], tmp117
	addq	$16, %rdx	#, ivtmp.48
	addq	$8, %rcx	#, ivtmp.49
	addq	$16, %rax	#, ivtmp.51
	addq	$16, %rsi	#, ivtmp.53
	mulsd	%xmm1, %xmm0	# tmp137, tmp117
# nbody.c:131:     positions[i][0] += delta_t * velocities[i][0];
	addsd	-24(%rax), %xmm0	# MEM[base: _59, offset: -8B], tmp120
	movsd	%xmm0, -24(%rax)	# tmp120, MEM[base: _59, offset: -8B]
# nbody.c:132:     positions[i][1] += delta_t * velocities[i][1];
	movsd	-8(%rdx), %xmm0	# MEM[base: _58, offset: 8B], tmp122
	mulsd	%xmm1, %xmm0	# tmp137, tmp122
# nbody.c:132:     positions[i][1] += delta_t * velocities[i][1];
	addsd	-16(%rax), %xmm0	# MEM[base: _59, offset: 0B], tmp125
	movsd	%xmm0, -16(%rax)	# tmp125, MEM[base: _59, offset: 0B]
# nbody.c:133:     velocities[i][0] += delta_t / masses[i] * forces[i][0];
	movapd	%xmm1, %xmm0	# tmp137, tmp127
	divsd	-8(%rcx), %xmm0	# MEM[base: _61, offset: 0B], tmp127
# nbody.c:133:     velocities[i][0] += delta_t / masses[i] * forces[i][0];
	mulsd	-24(%rsi), %xmm0	# MEM[base: _63, offset: -8B], tmp129
# nbody.c:133:     velocities[i][0] += delta_t / masses[i] * forces[i][0];
	addsd	-16(%rdx), %xmm0	# MEM[base: _58, offset: 0B], tmp130
	movsd	%xmm0, -16(%rdx)	# tmp130, MEM[base: _58, offset: 0B]
# nbody.c:134:     velocities[i][1] += delta_t / masses[i] * forces[i][1];
	movapd	%xmm1, %xmm0	# tmp137, tmp132
	divsd	-8(%rcx), %xmm0	# MEM[base: _61, offset: 0B], tmp132
# nbody.c:134:     velocities[i][1] += delta_t / masses[i] * forces[i][1];
	mulsd	-16(%rsi), %xmm0	# MEM[base: _63, offset: 0B], tmp134
# nbody.c:134:     velocities[i][1] += delta_t / masses[i] * forces[i][1];
	addsd	-8(%rdx), %xmm0	# MEM[base: _58, offset: 8B], tmp135
	movsd	%xmm0, -8(%rdx)	# tmp135, MEM[base: _58, offset: 8B]
# nbody.c:130:   for (uint i = 0; i < N; i++) {
	cmpq	%rdi, %rdx	# _65, ivtmp.48
	jne	.L29	#,
# nbody.c:136: }
	ret	
	.cfi_endproc
.LFE55:
	.size	move_positions, .-move_positions
	.p2align 4
	.globl	n_body_solver_simple
	.type	n_body_solver_simple, @function
n_body_solver_simple:
.LFB51:
	.cfi_startproc
	endbr64	
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdx, %r14	# tmp89, velocities
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13	# tmp87, forces
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12	# tmp88, positions
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp	# tmp90, masses
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# nbody.c:79:                           double *masses) {
	movl	$100, %ebx	#, ivtmp_1
	.p2align 4,,10
	.p2align 3
.L32:
# nbody.c:81:     update_forces_simple(forces, positions, masses);
	movq	%rbp, %rdx	# masses,
	movq	%r12, %rsi	# positions,
	movq	%r13, %rdi	# forces,
	call	update_forces_simple	#
# nbody.c:82:     move_positions(forces, positions, velocities, masses);
	movq	%rbp, %rcx	# masses,
	movq	%r14, %rdx	# velocities,
	movq	%r12, %rsi	# positions,
	movq	%r13, %rdi	# forces,
	call	move_positions	#
# nbody.c:80:   for (uint i = 0; i < iterations; i++) {
	subl	$1, %ebx	#, ivtmp_1
	jne	.L32	#,
# nbody.c:84: }
	popq	%rbx	#
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE51:
	.size	n_body_solver_simple, .-n_body_solver_simple
	.p2align 4
	.globl	n_body_solver
	.type	n_body_solver, @function
n_body_solver:
.LFB52:
	.cfi_startproc
	endbr64	
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdx, %r14	# tmp89, velocities
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13	# tmp87, forces
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rsi, %r12	# tmp88, positions
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rcx, %rbp	# tmp90, masses
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# nbody.c:87:                    double *masses) {
	movl	$100, %ebx	#, ivtmp_1
	.p2align 4,,10
	.p2align 3
.L36:
# nbody.c:89:     update_forces(forces, positions, masses);
	movq	%rbp, %rdx	# masses,
	movq	%r12, %rsi	# positions,
	movq	%r13, %rdi	# forces,
	call	update_forces	#
# nbody.c:90:     move_positions(forces, positions, velocities, masses);
	movq	%rbp, %rcx	# masses,
	movq	%r14, %rdx	# velocities,
	movq	%r12, %rsi	# positions,
	movq	%r13, %rdi	# forces,
	call	move_positions	#
# nbody.c:88:   for (uint i = 0; i < iterations; i++) {
	subl	$1, %ebx	#, ivtmp_1
	jne	.L36	#,
# nbody.c:92: }
	popq	%rbx	#
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE52:
	.size	n_body_solver, .-n_body_solver
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"----------nbody solver measurement----------"
	.align 8
.LC9:
	.string	"number of particles: %d \t delta_t: %f \t iterations: %d \n"
	.align 8
.LC10:
	.string	"execution time: %11.8f s (average over %d measurements) \n"
	.align 8
.LC11:
	.string	"measurement variance: %11.8f \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
# nbody.c:30:   vect_t *forces = malloc(N * sizeof(vect_t));
	movl	$32000, %edi	#,
# nbody.c:28: int main() {
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
# nbody.c:33:   double *masses = malloc(N * sizeof(double));
	xorl	%r13d, %r13d	# ivtmp.106
# nbody.c:28: int main() {
	pushq	%r12	#
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# nbody.c:28: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp239
	movq	%rax, -56(%rbp)	# tmp239, D.4768
	xorl	%eax, %eax	# tmp239
# nbody.c:30:   vect_t *forces = malloc(N * sizeof(vect_t));
	call	malloc@PLT	#
# nbody.c:31:   vect_t *positions = malloc(N * sizeof(vect_t));
	movl	$32000, %edi	#,
# nbody.c:30:   vect_t *forces = malloc(N * sizeof(vect_t));
	movq	%rax, -128(%rbp)	# tmp230, %sfp
# nbody.c:31:   vect_t *positions = malloc(N * sizeof(vect_t));
	call	malloc@PLT	#
# nbody.c:32:   vect_t *velocities = malloc(N * sizeof(vect_t));
	movl	$32000, %edi	#,
# nbody.c:31:   vect_t *positions = malloc(N * sizeof(vect_t));
	movq	%rax, %rbx	# tmp231, positions
# nbody.c:32:   vect_t *velocities = malloc(N * sizeof(vect_t));
	call	malloc@PLT	#
# nbody.c:33:   double *masses = malloc(N * sizeof(double));
	movl	$16000, %edi	#,
# nbody.c:32:   vect_t *velocities = malloc(N * sizeof(vect_t));
	movq	%rax, %r12	# tmp232, velocities
# nbody.c:33:   double *masses = malloc(N * sizeof(double));
	call	malloc@PLT	#
	movq	%rax, -136(%rbp)	# masses, %sfp
	movq	%rax, %r14	# masses, ivtmp.103
	.p2align 4,,10
	.p2align 3
.L40:
# nbody.c:37:     positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:37:     positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	pxor	%xmm0, %xmm0	# tmp150
	addq	$8, %r14	#, ivtmp.103
	cvtsi2sdl	%eax, %xmm0	# tmp234, tmp150
	divsd	.LC3(%rip), %xmm0	#, tmp151
# nbody.c:37:     positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# tmp151, tmp153
# nbody.c:37:     positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	subsd	.LC4(%rip), %xmm0	#, tmp154
# nbody.c:37:     positions[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, (%rbx,%r13)	# tmp154, MEM[base: positions_52, index: ivtmp.106_127, offset: 0B]
# nbody.c:38:     positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:38:     positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	pxor	%xmm0, %xmm0	# tmp156
	cvtsi2sdl	%eax, %xmm0	# tmp235, tmp156
	divsd	.LC3(%rip), %xmm0	#, tmp157
# nbody.c:38:     positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# tmp157, tmp159
# nbody.c:38:     positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	subsd	.LC4(%rip), %xmm0	#, tmp160
# nbody.c:38:     positions[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, 8(%rbx,%r13)	# tmp160, MEM[base: positions_52, index: ivtmp.106_127, offset: 8B]
# nbody.c:40:     velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:40:     velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	pxor	%xmm0, %xmm0	# tmp162
	cvtsi2sdl	%eax, %xmm0	# tmp236, tmp162
	divsd	.LC3(%rip), %xmm0	#, tmp163
# nbody.c:40:     velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# tmp163, tmp165
# nbody.c:40:     velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	subsd	.LC4(%rip), %xmm0	#, tmp166
# nbody.c:40:     velocities[i][0] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, (%r12,%r13)	# tmp166, MEM[base: velocities_54, index: ivtmp.106_127, offset: 0B]
# nbody.c:41:     velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:41:     velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	pxor	%xmm0, %xmm0	# tmp168
	cvtsi2sdl	%eax, %xmm0	# tmp237, tmp168
	divsd	.LC3(%rip), %xmm0	#, tmp169
# nbody.c:41:     velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# tmp169, tmp171
# nbody.c:41:     velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	subsd	.LC4(%rip), %xmm0	#, tmp172
# nbody.c:41:     velocities[i][1] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, 8(%r12,%r13)	# tmp172, MEM[base: velocities_54, index: ivtmp.106_127, offset: 8B]
	addq	$16, %r13	#, ivtmp.106
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	call	rand@PLT	#
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	pxor	%xmm0, %xmm0	# tmp174
	cvtsi2sdl	%eax, %xmm0	# tmp238, tmp174
	divsd	.LC3(%rip), %xmm0	#, tmp175
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	addsd	%xmm0, %xmm0	# tmp175, tmp177
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	subsd	.LC4(%rip), %xmm0	#, tmp178
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	andpd	.LC5(%rip), %xmm0	#, tmp180
# nbody.c:43:     masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);
	movsd	%xmm0, -8(%r14)	# tmp180, MEM[base: _136, offset: 0B]
# nbody.c:36:   for (uint i = 0; i < N; i++) {
	cmpq	$32000, %r13	#, ivtmp.106
	jne	.L40	#,
# nbody.c:48:   double timings[ITERATIONS];
	movq	%rsp, %rax	#, tmp190
	cmpq	%rax, %rsp	# tmp190,
	je	.L42	#,
.L53:
	subq	$4096, %rsp	#,
	orq	$0, 4088(%rsp)	#,
	cmpq	%rax, %rsp	# tmp190,
	jne	.L53	#,
.L42:
	subq	$800, %rsp	#,
	orq	$0, 792(%rsp)	#,
# nbody.c:50:   n_body_solver(forces, positions, velocities, masses); // cache heating run
	movq	-136(%rbp), %rcx	# %sfp,
	movq	-128(%rbp), %rdi	# %sfp,
# nbody.c:48:   double timings[ITERATIONS];
	movq	%rsp, %r15	#, tmp198
# nbody.c:50:   n_body_solver(forces, positions, velocities, masses); // cache heating run
	movq	%r12, %rdx	# velocities,
	leaq	-88(%rbp), %r14	#, tmp227
	movq	%rbx, %rsi	# positions,
# nbody.c:48:   double timings[ITERATIONS];
	movq	%r15, -144(%rbp)	# tmp198, %sfp
	leaq	-80(%rbp), %r13	#, tmp228
# nbody.c:50:   n_body_solver(forces, positions, velocities, masses); // cache heating run
	call	n_body_solver	#
	movq	%r15, %r9	# tmp198, tmp198
	leaq	800(%r15), %r10	#, _129
	.p2align 4,,10
	.p2align 3
.L44:
# nbody.c:144:   i = gettimeofday(&tp, &tzp);
	movq	%r14, %rsi	# tmp227,
	movq	%r13, %rdi	# tmp228,
	movq	%r9, -120(%rbp)	# ivtmp.94, %sfp
	movq	%r10, -112(%rbp)	# _129, %sfp
	call	gettimeofday@PLT	#
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp201
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp204
# nbody.c:54:     n_body_solver_simple(forces, positions, velocities, masses);
	movq	%r12, %rdx	# velocities,
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	-72(%rbp), %xmm0	# tp.tv_usec, tmp201
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC6(%rip), %xmm0	#, tmp202
# nbody.c:54:     n_body_solver_simple(forces, positions, velocities, masses);
	movq	-128(%rbp), %rdi	# %sfp,
	movq	%rbx, %rsi	# positions,
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	-80(%rbp), %xmm1	# tp.tv_sec, tmp204
# nbody.c:54:     n_body_solver_simple(forces, positions, velocities, masses);
	movq	-136(%rbp), %rcx	# %sfp,
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp204, tmp202
	movsd	%xmm0, -104(%rbp)	# tmp202, %sfp
# nbody.c:54:     n_body_solver_simple(forces, positions, velocities, masses);
	call	n_body_solver_simple	#
# nbody.c:144:   i = gettimeofday(&tp, &tzp);
	movq	%r14, %rsi	# tmp227,
	movq	%r13, %rdi	# tmp228,
	call	gettimeofday@PLT	#
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp207
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp210
# nbody.c:55:     timings[j] = mysecond() - t0;
	movq	-120(%rbp), %r9	# %sfp, ivtmp.94
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	-72(%rbp), %xmm0	# tp.tv_usec, tmp207
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC6(%rip), %xmm0	#, tmp208
# nbody.c:51:   for (int j = 0; j < ITERATIONS; j++) {
	movq	-112(%rbp), %r10	# %sfp, _129
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	-80(%rbp), %xmm1	# tp.tv_sec, tmp210
	addq	$8, %r9	#, ivtmp.94
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp210, _88
# nbody.c:55:     timings[j] = mysecond() - t0;
	subsd	-104(%rbp), %xmm0	# %sfp, tmp211
# nbody.c:55:     timings[j] = mysecond() - t0;
	movsd	%xmm0, -8(%r9)	# tmp211, MEM[base: _131, offset: 0B]
# nbody.c:51:   for (int j = 0; j < ITERATIONS; j++) {
	cmpq	%r9, %r10	# ivtmp.94, _129
	jne	.L44	#,
	movq	-144(%rbp), %rax	# %sfp, ivtmp.87
# nbody.c:59:   double mean=0, variance=0;
	pxor	%xmm0, %xmm0	# mean
	.p2align 4,,10
	.p2align 3
.L45:
# nbody.c:61:     mean += timings[i];
	addsd	(%rax), %xmm0	# MEM[base: _35, offset: 0B], mean
	addq	$8, %rax	#, ivtmp.87
# nbody.c:60:   for (int i=0; i<ITERATIONS; i++) {
	cmpq	%r10, %rax	# _129, ivtmp.87
	jne	.L45	#,
# nbody.c:59:   double mean=0, variance=0;
	pxor	%xmm2, %xmm2	# variance
# nbody.c:63:   mean /= (double)ITERATIONS;
	movapd	%xmm0, %xmm1	# mean, mean
	divsd	.LC7(%rip), %xmm1	#, mean
	.p2align 4,,10
	.p2align 3
.L46:
# nbody.c:65:     variance += (timings[i]-mean) * (timings[i]-mean);
	movsd	(%r15), %xmm0	# MEM[base: _46, offset: 0B], MEM[base: _46, offset: 0B]
	addq	$8, %r15	#, ivtmp.80
	subsd	%xmm1, %xmm0	# mean, _41
# nbody.c:65:     variance += (timings[i]-mean) * (timings[i]-mean);
	mulsd	%xmm0, %xmm0	# _41, tmp214
# nbody.c:65:     variance += (timings[i]-mean) * (timings[i]-mean);
	addsd	%xmm0, %xmm2	# tmp214, variance
# nbody.c:64:   for (int i=0; i<ITERATIONS; i++) {
	cmpq	%r10, %r15	# _129, ivtmp.80
	jne	.L46	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC8(%rip), %rdi	#,
	movsd	%xmm2, -112(%rbp)	# variance, %sfp
	movsd	%xmm1, -104(%rbp)	# mean, %sfp
	call	puts@PLT	#
	movl	$100, %ecx	#,
	movsd	.LC2(%rip), %xmm0	#,
	movl	$2000, %edx	#,
	leaq	.LC9(%rip), %rsi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
	movsd	-104(%rbp), %xmm1	# %sfp, mean
	movl	$100, %edx	#,
	leaq	.LC10(%rip), %rsi	#,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
	movapd	%xmm1, %xmm0	# mean,
	call	__printf_chk@PLT	#
# nbody.c:67:   variance /= (double)ITERATIONS;
	movsd	-112(%rbp), %xmm2	# %sfp, variance
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
# nbody.c:67:   variance /= (double)ITERATIONS;
	divsd	.LC7(%rip), %xmm2	#, variance
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC11(%rip), %rsi	#,
# nbody.c:67:   variance /= (double)ITERATIONS;
	movapd	%xmm2, %xmm0	# variance, variance
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# nbody.c:76: }
	movq	-56(%rbp), %rax	# D.4768, tmp240
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp240
	jne	.L54	#,
	leaq	-40(%rbp), %rsp	#,
	xorl	%eax, %eax	#
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L54:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.text
	.p2align 4
	.globl	mysecond
	.type	mysecond, @function
mysecond:
.LFB56:
	.cfi_startproc
	endbr64	
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 64
# nbody.c:139: double mysecond() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	movq	%rax, 40(%rsp)	# tmp97, D.4777
	xorl	%eax, %eax	# tmp97
# nbody.c:144:   i = gettimeofday(&tp, &tzp);
	leaq	8(%rsp), %rsi	#, tmp89
	leaq	16(%rsp), %rdi	#, tmp90
	call	gettimeofday@PLT	#
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm0, %xmm0	# tmp91
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	pxor	%xmm1, %xmm1	# tmp94
# nbody.c:146: }
	movq	40(%rsp), %rax	# D.4777, tmp98
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	24(%rsp), %xmm0	# tp.tv_usec, tmp91
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	mulsd	.LC6(%rip), %xmm0	#, tmp92
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	cvtsi2sdq	16(%rsp), %xmm1	# tp.tv_sec, tmp94
# nbody.c:145:   return ((double)tp.tv_sec + (double)tp.tv_usec * 1.e-6);
	addsd	%xmm1, %xmm0	# tmp94, <retval>
# nbody.c:146: }
	jne	.L58	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L58:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE56:
	.size	mysecond, .-mysecond
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	3489822989
	.long	1037195188
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	2696277389
	.long	1051772663
	.align 8
.LC7:
	.long	0
	.long	1079574528
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
