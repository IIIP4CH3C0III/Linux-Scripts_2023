	.file	"system.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"xrandr --listactivemonitors"
.LC2:
	.string	"%*d: +%s %*sx%*s/%*s %*s\n"
	.text
	.globl	getMonitors
	.type	getMonitors, @function
getMonitors:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	popen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L4
.L5:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	testl	%eax, %eax
	je	.L4
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.L4:
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	pclose@PLT
	movl	$1, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getMonitors, .-getMonitors
	.globl	format
	.data
	.align 32
	.type	format, @object
	.size	format, 4096
format:
	.string	"\t Brightness: %f"
	.zero	1007
	.string	"\t Gamma: %f:%f:%f"
	.zero	1006
	.string	"\t color vibrance: %d"
	.zero	1003
	.string	"\t vibrant hue: %d"
	.zero	1006
	.globl	retrive
	.align 32
	.type	retrive, @object
	.size	retrive, 4096
retrive:
	.string	"xrandr --verbose | grep -i brightness"
	.zero	986
	.string	"xrandr --verbose | grep -i gamma"
	.zero	991
	.string	"xrandr --verbose | grep -i color"
	.zero	991
	.string	"xrandr --verbose | grep -i hue"
	.zero	993
	.section	.rodata
	.align 8
.LC3:
	.string	"Error001: Can't retrive brightness value"
	.align 8
.LC4:
	.string	"Error002: Can't retrive gamma value"
	.align 8
.LC5:
	.string	"Error003: Can't retrive color value"
	.align 8
.LC6:
	.string	"Error004: Can't retrive hue value"
	.text
	.globl	getData
	.type	getData, @function
getData:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L7
.L16:
	movl	-8(%rbp), %eax
	cltq
	salq	$10, %rax
	movq	%rax, %rdx
	leaq	retrive(%rip), %rax
	addq	%rdx, %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	popen@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L8
	movl	$0, %eax
	jmp	.L9
.L8:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L10
.L15:
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	cmpl	$0, -8(%rbp)
	jne	.L11
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1024(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$10, %rax
	movq	%rax, %rcx
	leaq	format(%rip), %rax
	addq	%rax, %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L11
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L9
.L11:
	cmpl	$1, -8(%rbp)
	jne	.L12
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1036(%rax), %rdi
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1032(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1028(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$10, %rax
	movq	%rax, %rsi
	leaq	format(%rip), %rax
	addq	%rax, %rsi
	movq	-48(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$3, %eax
	je	.L12
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L9
.L12:
	cmpl	$2, -8(%rbp)
	jne	.L13
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1040(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$10, %rax
	movq	%rax, %rcx
	leaq	format(%rip), %rax
	addq	%rax, %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L13
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L9
.L13:
	cmpl	$3, -8(%rbp)
	jne	.L14
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1044(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$10, %rax
	movq	%rax, %rcx
	leaq	format(%rip), %rax
	addq	%rax, %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	cmpl	$1, %eax
	je	.L14
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L9
.L14:
	subl	$1, -4(%rbp)
.L10:
	cmpl	$0, -4(%rbp)
	jns	.L15
	addl	$1, -8(%rbp)
.L7:
	cmpl	$3, -8(%rbp)
	jle	.L16
	movl	$1, %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	getData, .-getData
	.globl	selectMonitor
	.type	selectMonitor, @function
selectMonitor:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	cmpl	$259, -8(%rbp)
	jne	.L18
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L19
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	jmp	.L20
.L19:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	jmp	.L20
.L18:
	cmpl	$258, -8(%rbp)
	jne	.L21
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L22
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	jmp	.L20
.L22:
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	jmp	.L20
.L21:
	movl	$0, %eax
.L20:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	selectMonitor, .-selectMonitor
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
