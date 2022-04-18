	.file	"serialsum.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"--------------------------------------------------------------------------------"
	.align 8
.LC1:
	.string	"ARRAY SIZE: %d\tITERATIONS: %d\n"
	.align 8
.LC2:
	.string	"Clock measurements: microseconds"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"measured time: %f\n"
.LC6:
	.string	"result: %f\n"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"min: %f \nmax: %f \nmean: %f \nvariance:%f \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-7999488(%rsp), %r11
	.cfi_def_cfa 11, 7999536
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$592, %rsp
	.cfi_def_cfa_offset 8000128
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8000072(%rsp)
	xorl	%eax, %eax
	leaq	64(%rsp), %rbx
	leaq	8000064(%rsp), %r14
	call	puts@PLT
	movl	$1000, %ecx
	movl	$1000000, %edx
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %rbx
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -8(%rbx)
	cmpq	%r14, %rbx
	jne	.L2
	movl	$1000, %ebx
	leaq	40(%rsp), %r12
	leaq	48(%rsp), %rbp
	leaq	.LC5(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	%r12, %rsi
	cvtsi2sdq	56(%rsp), %xmm0
	mulsd	.LC4(%rip), %xmm0
	movq	%rbp, %rdi
	cvtsi2sdq	48(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	%r13, %rsi
	cvtsi2sdq	56(%rsp), %xmm0
	movl	$1, %edi
	movl	$1, %eax
	mulsd	.LC4(%rip), %xmm0
	cvtsi2sdq	48(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	subsd	(%rsp), %xmm0
	call	__printf_chk@PLT
	subl	$1, %ebx
	jne	.L3
	movsd	64(%rsp), %xmm3
	leaq	72(%rsp), %rax
	movq	%rax, %rdx
	movapd	%xmm3, %xmm4
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	minsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm4
	cmpq	%r14, %rdx
	jne	.L6
	movq	%rax, %rdx
	movapd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	maxsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	cmpq	%r14, %rdx
	jne	.L9
	movq	%rax, %rdx
	movapd	%xmm3, %xmm2
	.p2align 4,,10
	.p2align 3
.L12:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	minsd	%xmm2, %xmm0
	movapd	%xmm0, %xmm2
	cmpq	%r14, %rdx
	jne	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	movsd	(%rax), %xmm0
	addq	$8, %rax
	minsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm3
	cmpq	%r14, %rax
	jne	.L15
	movsd	%xmm0, (%rsp)
	leaq	.LC6(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	movsd	%xmm4, 24(%rsp)
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	call	__printf_chk@PLT
	movsd	24(%rsp), %xmm4
	movsd	(%rsp), %xmm3
	leaq	.LC8(%rip), %rsi
	movsd	8(%rsp), %xmm2
	movsd	16(%rsp), %xmm1
	movl	$1, %edi
	movl	$4, %eax
	movapd	%xmm4, %xmm0
	call	__printf_chk@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movq	8000072(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L29
	addq	$8000080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.text
	.p2align 4
	.globl	initialise_random
	.type	initialise_random, @function
initialise_random:
.LFB40:
	.cfi_startproc
	endbr64
	testq	%rsi, %rsi
	je	.L38
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	(%rdi,%rsi,8), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L32:
	call	rand@PLT
	pxor	%xmm0, %xmm0
	addq	$8, %rbx
	cvtsi2sdl	%eax, %xmm0
	divsd	.LC3(%rip), %xmm0
	movsd	%xmm0, -8(%rbx)
	cmpq	%rbp, %rbx
	jne	.L32
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE40:
	.size	initialise_random, .-initialise_random
	.p2align 4
	.globl	serial_sum
	.type	serial_sum, @function
serial_sum:
.LFB41:
	.cfi_startproc
	endbr64
	testq	%rsi, %rsi
	je	.L44
	leaq	(%rdi,%rsi,8), %rax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L43:
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	cmpq	%rax, %rdi
	jne	.L43
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE41:
	.size	serial_sum, .-serial_sum
	.p2align 4
	.globl	mysecond
	.type	mysecond, @function
mysecond:
.LFB42:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	call	gettimeofday@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	cvtsi2sdq	24(%rsp), %xmm0
	mulsd	.LC4(%rip), %xmm0
	cvtsi2sdq	16(%rsp), %xmm1
	addsd	%xmm1, %xmm0
	jne	.L49
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE42:
	.size	mysecond, .-mysecond
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB43:
	.cfi_startproc
	endbr64
	movsd	(%rdi), %xmm0
	cmpl	$1, %esi
	jbe	.L50
	leal	-2(%rsi), %edx
	leaq	8(%rdi), %rax
	leaq	16(%rdi,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L54:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	minsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L54
.L50:
	ret
	.cfi_endproc
.LFE43:
	.size	min, .-min
	.p2align 4
	.globl	max
	.type	max, @function
max:
.LFB44:
	.cfi_startproc
	endbr64
	movsd	(%rdi), %xmm0
	cmpl	$1, %esi
	jbe	.L57
	leal	-2(%rsi), %edx
	leaq	8(%rdi), %rax
	leaq	16(%rdi,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L61:
	movsd	(%rax), %xmm1
	addq	$8, %rax
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L61
.L57:
	ret
	.cfi_endproc
.LFE44:
	.size	max, .-max
	.p2align 4
	.globl	mean
	.type	mean, @function
mean:
.LFB45:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	je	.L69
	leal	-1(%rsi), %eax
	pxor	%xmm0, %xmm0
	leaq	8(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L66:
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	cmpq	%rax, %rdi
	jne	.L66
	movl	%esi, %esi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rsi, %xmm1
	divsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L69:
	movl	%esi, %esi
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rsi, %xmm1
	divsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE45:
	.size	mean, .-mean
	.p2align 4
	.globl	sample_var
	.type	sample_var, @function
sample_var:
.LFB46:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	je	.L80
	leal	-1(%rsi), %eax
	pxor	%xmm0, %xmm0
	movq	%rax, %rcx
	leaq	8(%rdi,%rax,8), %rdx
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L73:
	addsd	(%rax), %xmm0
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L73
	movl	%esi, %esi
	pxor	%xmm1, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdq	%rsi, %xmm1
	divsd	%xmm1, %xmm0
	.p2align 4,,10
	.p2align 3
.L75:
	movsd	(%rdi), %xmm1
	addq	$8, %rdi
	subsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm2
	cmpq	%rdi, %rdx
	jne	.L75
	movl	%ecx, %ecx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
	divsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	movl	$-1, %ecx
	pxor	%xmm0, %xmm0
	pxor	%xmm2, %xmm2
	movl	%ecx, %ecx
	cvtsi2sdq	%rcx, %xmm0
	divsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	ret
	.cfi_endproc
.LFE46:
	.size	sample_var, .-sample_var
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	2696277389
	.long	1051772663
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
