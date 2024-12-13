	.file	"capslock_control.c"
	.text
	.section	.rodata
.LC0:
	.string	"Usage: %s <0|1>\n"
	.align 8
.LC1:
	.string	"/sys/class/leds/input3::capslock/brightness"
	.align 8
.LC2:
	.string	"Failed to open capslock brightness file"
.LC3:
	.string	"%s\n"
	.align 8
.LC4:
	.string	"Failed to write to capslock brightness file"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	cmpl	$2, -20(%rbp)
	je	.L2
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	$2, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L3
.L4:
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	leaq	.LC3(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	dprintf@PLT
	testl	%eax, %eax
	jns	.L5
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$1, %eax
	jmp	.L3
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
