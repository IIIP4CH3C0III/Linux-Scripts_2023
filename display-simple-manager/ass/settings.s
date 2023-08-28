	.file	"settings.c"
	.text
	.section	.rodata
.LC1:
	.string	"Values range ( 0 - 100 )"
.LC2:
	.string	" "
.LC3:
	.string	"%f"
	.text
	.globl	setValues
	.type	setValues, @function
setValues:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movl	%ecx, -88(%rbp)
	movl	%r8d, -92(%rbp)
	movl	%r9d, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	echo@PLT
	movq	stdscr(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	movl	$21, -44(%rbp)
	movl	-84(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-88(%rbp), %eax
	addl	%edx, %eax
	addl	$3, %eax
	movl	%eax, -40(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -36(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -32(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -28(%rbp)
	movl	LINES(%rip), %eax
	leal	-1(%rax), %esi
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	movl	$0, %eax
	call	mvwprintw@PLT
	cmpl	$2, -88(%rbp)
	je	.L2
	jmp	.L3
.L8:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	movl	$25, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movl	$0, -56(%rbp)
	jmp	.L4
.L5:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	addl	$1, -56(%rbp)
.L4:
	movl	COLS(%rip), %eax
	subl	-44(%rbp), %eax
	cmpl	%eax, -56(%rbp)
	jl	.L5
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	movl	$25, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wscanw@PLT
	movss	-60(%rbp), %xmm0
	movss	.LC0(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L3
	movss	.LC0(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	je	.L23
	jmp	.L3
.L23:
	movl	$0, %eax
	jmp	.L21
.L3:
	movss	-60(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jnb	.L8
	movss	-60(%rbp), %xmm0
	comiss	.LC5(%rip), %xmm0
	ja	.L8
	jmp	.L9
.L2:
	movl	$0, -52(%rbp)
	jmp	.L10
.L15:
	movl	-52(%rbp), %eax
	sall	$2, %eax
	leal	25(%rax), %edx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	movl	$0, -48(%rbp)
	jmp	.L12
.L13:
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wprintw@PLT
	addl	$1, -48(%rbp)
.L12:
	cmpl	$2, -48(%rbp)
	jle	.L13
	movl	-52(%rbp), %eax
	sall	$2, %eax
	leal	25(%rax), %edx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	wmove@PLT
	leaq	-36(%rbp), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	wscanw@PLT
	movl	-52(%rbp), %eax
	cltq
	movss	-36(%rbp,%rax,4), %xmm0
	movss	.LC0(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L11
	movss	.LC0(%rip), %xmm1
	ucomiss	%xmm1, %xmm0
	je	.L24
	jmp	.L11
.L24:
	movl	$0, %eax
	jmp	.L21
.L11:
	movl	-52(%rbp), %eax
	cltq
	movss	-36(%rbp,%rax,4), %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jnb	.L15
	movl	-52(%rbp), %eax
	cltq
	movss	-36(%rbp,%rax,4), %xmm0
	comiss	.LC5(%rip), %xmm0
	ja	.L15
	addl	$1, -52(%rbp)
.L10:
	cmpl	$2, -52(%rbp)
	jle	.L11
.L9:
	cmpl	$1, -88(%rbp)
	jne	.L17
	movss	-60(%rbp), %xmm0
	movl	-84(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rax
	leaq	-1048(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movss	.LC5(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, 1024(%rax)
.L17:
	cmpl	$2, -88(%rbp)
	jne	.L18
	movss	-36(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$100, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	map
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC6(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-84(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rax
	leaq	-1048(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1028(%rax)
	movss	-32(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$100, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	map
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC6(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-84(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rax
	leaq	-1048(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1036(%rax)
	movss	-28(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$100, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	map
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC6(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movl	-84(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rax
	leaq	-1048(%rax), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 1032(%rax)
.L18:
	cmpl	$3, -88(%rbp)
	jne	.L19
	movss	-60(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1048, %rdx, %rdx
	leaq	-1048(%rdx), %rcx
	movq	-72(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$100, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	map
	movl	%eax, 1040(%rbx)
.L19:
	cmpl	$4, -88(%rbp)
	jne	.L20
	movss	-60(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1048, %rdx, %rdx
	leaq	-1048(%rdx), %rcx
	movq	-72(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movl	-96(%rbp), %ecx
	movl	-92(%rbp), %edx
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$100, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	map
	movl	%eax, 1044(%rbx)
.L20:
	call	noecho@PLT
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	movl	$1, %eax
.L21:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	setValues, .-setValues
	.globl	copyData
	.type	copyData, @function
copyData:
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
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L26
.L27:
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	1024(%rdx), %xmm0
	movss	%xmm0, 1024(%rax)
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	1028(%rdx), %xmm0
	movss	%xmm0, 1028(%rax)
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	1032(%rdx), %xmm0
	movss	%xmm0, 1032(%rax)
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	1036(%rdx), %xmm0
	movss	%xmm0, 1036(%rax)
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1048, %rdx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	1040(%rax), %eax
	movl	%eax, 1040(%rdx)
	movl	-4(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1048, %rdx, %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movl	1044(%rax), %eax
	movl	%eax, 1044(%rdx)
	addl	$1, -4(%rbp)
.L26:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L27
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	copyData, .-copyData
	.globl	options
	.data
	.align 32
	.type	options, @object
	.size	options, 4096
options:
	.string	" --brightness "
	.zero	1009
	.string	" --gamma "
	.zero	1014
	.string	" --set 'color vibrance' "
	.zero	999
	.string	" --set 'vibrant hue' "
	.zero	1002
	.section	.rodata
.LC7:
	.string	"r"
	.align 8
.LC8:
	.string	"Confirm changes by pressing <y>, cancel <any key>."
	.align 8
.LC9:
	.string	"Changes made, and confirmed, acknowledge <any key>."
	.align 8
.LC10:
	.string	"Back to before, acknowledge <any key> "
	.text
	.globl	applyValues
	.type	applyValues, @function
applyValues:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L29
.L36:
	movl	-12(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	createCommand
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	popen@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L30
	movl	$0, %eax
	jmp	.L31
.L30:
	movl	LINES(%rip), %eax
	subl	$1, %eax
	leaq	.LC8(%rip), %rdx
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
	movb	%al, -13(%rbp)
	cmpb	$121, -13(%rbp)
	je	.L32
	cmpb	$89, -13(%rbp)
	jne	.L33
.L32:
	movl	LINES(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	clearLine@PLT
	movl	LINES(%rip), %eax
	subl	$1, %eax
	leaq	.LC9(%rip), %rdx
	movl	$1, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
	jmp	.L34
.L33:
	movl	-12(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	createCommand
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	popen@PLT
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L35
	movl	$0, %eax
	jmp	.L31
.L35:
	movl	LINES(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	clearLine@PLT
	movl	LINES(%rip), %eax
	subl	$1, %eax
	leaq	.LC10(%rip), %rdx
	movl	$1, %esi
	movl	%eax, %edi
	movl	$0, %eax
	call	mvprintw@PLT
	movq	stdscr(%rip), %rax
	movq	%rax, %rdi
	call	wgetch@PLT
.L34:
	movq	stdscr(%rip), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	nodelay@PLT
	addl	$1, -12(%rbp)
.L29:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L36
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	applyValues, .-applyValues
	.section	.rodata
.LC11:
	.string	" %3.2f "
.LC12:
	.string	" %3.2f:"
.LC13:
	.string	"%3.2f:"
.LC14:
	.string	"%3.2f "
.LC15:
	.string	" %3d "
	.text
	.globl	createCommand
	.type	createCommand, @function
createCommand:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movl	%esi, -156(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movabsq	$3251724706635674232, %rsi
	movabsq	$2338623232362770221, %rdi
	movq	%rsi, (%rax)
	movq	%rdi, 8(%rax)
	movb	$0, 16(%rax)
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-136(%rbp), %rax
	leaq	options(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movss	1024(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	leaq	-128(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-136(%rbp), %rax
	leaq	1024+options(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movss	1028(%rax), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	leaq	-128(%rbp), %rdx
	addq	$20, %rdx
	movq	%rax, %xmm0
	leaq	.LC12(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movss	1032(%rax), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	leaq	-128(%rbp), %rdx
	addq	$40, %rdx
	movq	%rax, %xmm0
	leaq	.LC13(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movss	1036(%rax), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	leaq	-128(%rbp), %rdx
	addq	$60, %rdx
	movq	%rax, %xmm0
	leaq	.LC14(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$1, %eax
	call	sprintf@PLT
	movl	$1, -140(%rbp)
	jmp	.L38
.L39:
	leaq	-128(%rbp), %rcx
	movl	-140(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	addl	$1, -140(%rbp)
.L38:
	cmpl	$3, -140(%rbp)
	jle	.L39
	movq	-136(%rbp), %rax
	leaq	2048+options(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	1040(%rax), %eax
	leaq	-128(%rbp), %rdx
	leaq	80(%rdx), %rcx
	movl	%eax, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-128(%rbp), %rax
	leaq	80(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-136(%rbp), %rax
	leaq	3072+options(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movl	-156(%rbp), %eax
	cltq
	imulq	$1048, %rax, %rdx
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movl	1044(%rax), %eax
	leaq	-128(%rbp), %rdx
	leaq	100(%rdx), %rcx
	movl	%eax, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-128(%rbp), %rax
	leaq	100(%rax), %rdx
	movq	-136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movq	-136(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	createCommand, .-createCommand
	.globl	map
	.type	map, @function
map:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	-36(%rbp), %eax
	subl	-32(%rbp), %eax
	movl	-28(%rbp), %edx
	movl	%edx, %ecx
	subl	-24(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	imull	-28(%rbp), %eax
	movl	-36(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, -8(%rbp)
	movl	-12(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	map, .-map
	.section	.rodata
	.align 4
.LC0:
	.long	-1082130432
	.align 4
.LC5:
	.long	1120403456
	.align 8
.LC6:
	.long	0
	.long	1079574528
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
