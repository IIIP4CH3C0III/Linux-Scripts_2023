	.file	"printing.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	" Brightness/Gamma Manager V0.1"
	.text
	.globl	showVersion
	.type	showVersion, @function
showVersion:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	showVersion, .-showVersion
	.section	.rodata
	.align 8
.LC1:
	.string	" <B> brightness | <G> gamma | <C> color | <V> vibrance\n"
	.align 8
.LC2:
	.string	" <Q> quit | <arrows> move | <A> apply | <D> default "
	.text
	.globl	showKeys
	.type	showKeys, @function
showKeys:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	showKeys, .-showKeys
	.section	.rodata
.LC3:
	.string	" Monitor %d: %s\n"
.LC5:
	.string	"\tBrightness     : %3.0f \n"
	.align 8
.LC6:
	.string	"\tGamma          : %3.0f,%3.0f,%3.0f (r,g,b)%% \n"
.LC7:
	.string	"\tColor vibrance : %3d \n"
.LC8:
	.string	"\tVibrant hue    : %3d \n\n"
.LC9:
	.string	"\tMore down...\n"
.LC10:
	.string	" Need a bigger window!\n"
	.text
	.globl	printInformation
	.type	printInformation, @function
printInformation:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movl	$3, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movl	COLS(%rip), %eax
	cmpl	$44, %eax
	jle	.L4
	movl	$0, -4(%rbp)
	jmp	.L5
.L10:
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	LINES(%rip), %eax
	subl	$4, %eax
	cmpl	%eax, %ecx
	jge	.L6
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -32(%rbp)
	jne	.L7
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movl	$65536, %esi
	movq	%rax, %rdi
	call	wattr_on@PLT
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movl	$65536, %esi
	movq	%rax, %rdi
	call	wattr_off@PLT
	jmp	.L8
.L7:
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
.L8:
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	1024(%rax), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %xmm0
	leaq	.LC5(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	wprintw@PLT
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	1036(%rax), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	1032(%rax), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	1028(%rax), %xmm1
	movss	.LC4(%rip), %xmm0
	mulss	%xmm1, %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movapd	%xmm3, %xmm1
	movq	%rdx, %xmm0
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$3, %eax
	call	wprintw@PLT
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	1040(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	1044(%rax), %edx
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	jmp	.L9
.L6:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
.L9:
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L10
	jmp	.L11
.L4:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
.L11:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	printInformation, .-printInformation
	.section	.rodata
	.align 4
.LC4:
	.long	1120403456
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
