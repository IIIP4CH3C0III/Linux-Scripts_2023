	.file	"display.c"
	.text
	.globl	initDisplay
	.type	initDisplay, @function
initDisplay:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	initscr@PLT
	call	start_color@PLT
	call	cbreak@PLT
	call	noecho@PLT
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	keypad@PLT
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	call	use_default_colors@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	initDisplay, .-initDisplay
	.globl	exitDisplay
	.type	exitDisplay, @function
exitDisplay:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	endwin@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	exitDisplay, .-exitDisplay
	.globl	createNewWindow
	.type	createNewWindow, @function
createNewWindow:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	-32(%rbp), %ecx
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	newwin@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movl	-36(%rbp), %eax
	sall	$8, %eax
	movzwl	%ax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	wbkgd@PLT
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	createNewWindow, .-createNewWindow
	.globl	showDisplay
	.type	showDisplay, @function
showDisplay:
.LFB3:
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
	movl	$7, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	init_pair@PLT
	movl	$0, %edx
	movl	$7, %esi
	movl	$2, %edi
	call	init_pair@PLT
	movl	$2, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movl	$0, %edi
	call	createNewWindow
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	movl	$1, %r8d
	movl	$0, %ecx
	movl	$1, %edx
	movl	$0, %esi
	movl	$1, %edi
	call	createNewWindow
	movq	-16(%rbp), %rdx
	movq	%rax, (%rdx)
	movl	LINES(%rip), %eax
	subl	$3, %eax
	movl	$1, %r8d
	movl	$0, %ecx
	movl	%eax, %edx
	movl	$0, %esi
	movl	$2, %edi
	call	createNewWindow
	movq	-8(%rbp), %rdx
	movq	%rax, (%rdx)
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	wrefresh@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	showDisplay, .-showDisplay
	.globl	windowSizeChanges
	.type	windowSizeChanges, @function
windowSizeChanges:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	COLS(%rip), %eax
	cmpl	%eax, %edx
	jne	.L7
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	LINES(%rip), %eax
	cmpl	%eax, %edx
	je	.L8
.L7:
	movl	COLS(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movl	LINES(%rip), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movl	$1, %eax
	jmp	.L9
.L8:
	movl	$0, %eax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	windowSizeChanges, .-windowSizeChanges
	.section	.rodata
.LC0:
	.string	" "
	.text
	.globl	clearLine
	.type	clearLine, @function
clearLine:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %ecx
	movl	-20(%rbp), %eax
	leaq	.LC0(%rip), %rdx
	movl	%ecx, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	addl	$1, -4(%rbp)
.L11:
	movl	COLS(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L12
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	clearLine, .-clearLine
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
