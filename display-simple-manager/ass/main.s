	.file	"main.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Error retrieving monitor information.\n"
	.align 8
.LC1:
	.string	"No function to that key, acknowledge <any key>"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32544, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	initDisplay@PLT
	movl	LINES(%rip), %eax
	movl	%eax, -32532(%rbp)
	movl	COLS(%rip), %eax
	movl	%eax, -32528(%rbp)
	movq	$0, -32512(%rbp)
	movq	$0, -32504(%rbp)
	movq	$0, -32496(%rbp)
	movq	$0, -32488(%rbp)
	movl	$1, -32520(%rbp)
	movb	$0, -32535(%rbp)
	movb	$0, -32534(%rbp)
	movb	$1, -32533(%rbp)
	jmp	.L2
.L21:
	leaq	-32532(%rbp), %rdx
	leaq	-32528(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	windowSizeChanges@PLT
	testb	%al, %al
	jne	.L3
	cmpb	$0, -32533(%rbp)
	je	.L4
.L3:
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wclear@PLT
	movq	$0, -32512(%rbp)
	movq	$0, -32504(%rbp)
	movq	$0, -32496(%rbp)
	leaq	-32496(%rbp), %rdx
	leaq	-32504(%rbp), %rcx
	leaq	-32512(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	showDisplay@PLT
	leaq	-32504(%rbp), %rax
	movq	%rax, %rdi
	call	showVersion@PLT
	leaq	-32512(%rbp), %rax
	movq	%rax, %rdi
	call	showKeys@PLT
.L4:
	movzbl	-32534(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L5
	leaq	-1040(%rbp), %rcx
	movq	-32488(%rbp), %rdx
	leaq	-32524(%rbp), %rsi
	leaq	-32480(%rbp), %rax
	movq	%rax, %rdi
	call	getMonitors@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L6
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	call	exitDisplay@PLT
	movl	$1, %edi
	call	exit@PLT
.L6:
	leaq	-1040(%rbp), %rcx
	movq	-32488(%rbp), %rdx
	leaq	-32524(%rbp), %rsi
	leaq	-32480(%rbp), %rax
	movq	%rax, %rdi
	call	getData@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	call	exitDisplay@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	movl	-32520(%rbp), %ecx
	movl	-32524(%rbp), %esi
	leaq	-32496(%rbp), %rdx
	leaq	-32480(%rbp), %rax
	movq	%rax, %rdi
	call	printInformation@PLT
	movl	-32524(%rbp), %edx
	leaq	-22000(%rbp), %rcx
	leaq	-32480(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	copyData@PLT
	cmpb	$0, -32533(%rbp)
	je	.L8
	movl	-32524(%rbp), %edx
	leaq	-11520(%rbp), %rcx
	leaq	-32480(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	copyData@PLT
	movb	$0, -32533(%rbp)
	jmp	.L8
.L5:
	movl	-32520(%rbp), %ecx
	movl	-32524(%rbp), %esi
	leaq	-32496(%rbp), %rdx
	leaq	-22000(%rbp), %rax
	movq	%rax, %rdi
	call	printInformation@PLT
.L8:
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movl	%eax, -32516(%rbp)
	cmpl	$-1, -32516(%rbp)
	je	.L9
	cmpl	$118, -32516(%rbp)
	jg	.L10
	cmpl	$65, -32516(%rbp)
	jl	.L11
	movl	-32516(%rbp), %eax
	subl	$65, %eax
	cmpl	$53, %eax
	ja	.L11
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L13(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L13(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L13:
	.long	.L19-.L13
	.long	.L18-.L13
	.long	.L17-.L13
	.long	.L16-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L15-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L14-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L12-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L19-.L13
	.long	.L18-.L13
	.long	.L17-.L13
	.long	.L16-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L15-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L14-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L11-.L13
	.long	.L12-.L13
	.text
.L10:
	movl	-32516(%rbp), %eax
	subl	$258, %eax
	cmpl	$1, %eax
	jbe	.L20
.L11:
	movl	LINES(%rip), %eax
	subl	$1, %eax
	leaq	.LC1(%rip), %rdx
	movl	$1, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	movq	stdscr(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	jmp	.L9
.L14:
	movb	$1, -32535(%rbp)
	jmp	.L9
.L18:
	movl	-32520(%rbp), %edx
	leaq	-32496(%rbp), %rsi
	leaq	-22000(%rbp), %rax
	movl	$100, %r9d
	movl	$0, %r8d
	movl	$1, %ecx
	movq	%rax, %rdi
	call	setValues@PLT
	movb	%al, -32534(%rbp)
	jmp	.L9
.L15:
	movl	-32520(%rbp), %edx
	leaq	-32496(%rbp), %rsi
	leaq	-22000(%rbp), %rax
	movl	$1000, %r9d
	movl	$0, %r8d
	movl	$2, %ecx
	movq	%rax, %rdi
	call	setValues@PLT
	movb	%al, -32534(%rbp)
	jmp	.L9
.L17:
	movl	-32520(%rbp), %edx
	leaq	-32496(%rbp), %rsi
	leaq	-22000(%rbp), %rax
	movl	$200, %r9d
	movl	$0, %r8d
	movl	$3, %ecx
	movq	%rax, %rdi
	call	setValues@PLT
	movb	%al, -32534(%rbp)
	jmp	.L9
.L12:
	movl	-32520(%rbp), %edx
	leaq	-32496(%rbp), %rsi
	leaq	-22000(%rbp), %rax
	movl	$100, %r9d
	movl	$0, %r8d
	movl	$4, %ecx
	movq	%rax, %rdi
	call	setValues@PLT
	movb	%al, -32534(%rbp)
	jmp	.L9
.L20:
	movl	-32524(%rbp), %eax
	movl	-32516(%rbp), %edx
	leaq	-32520(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	selectMonitor@PLT
	jmp	.L9
.L19:
	movl	-32524(%rbp), %edx
	movq	-32488(%rbp), %rcx
	leaq	-11520(%rbp), %rsi
	leaq	-22000(%rbp), %rax
	movq	%rax, %rdi
	call	applyValues@PLT
	movb	$0, -32534(%rbp)
	jmp	.L9
.L16:
	movb	$1, -32534(%rbp)
	movl	-32524(%rbp), %edx
	leaq	-22000(%rbp), %rcx
	leaq	-11520(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	copyData@PLT
	nop
.L9:
	movl	$1, %edi
	call	sleep@PLT
	movl	LINES(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	clearLine@PLT
.L2:
	movzbl	-32535(%rbp), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	.L21
	call	exitDisplay@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
