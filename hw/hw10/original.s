	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
Lcfi3:
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	cmpl	$2, %ebx
	jl	LBB0_4
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_fork
	testl	%eax, %eax
	jne	LBB0_3
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	callq	_fork
LBB0_3:                                 ##   in Loop: Header=BB0_1 Depth=1
	decl	%ebx
	cmpl	$1, %ebx
	jg	LBB0_1
LBB0_4:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"fuck"


.subsections_via_symbols
