	.file	"2-3test.c"
	.globl	_a_static
	.data
	.align 4
_a_static:
	.long	1
	.section .rdata,"dr"
LC0:
	.ascii " = \0"
LC1:
	.ascii "\12\0"
	.text
	.globl	_print_var
	.def	_print_var;	.scl	2;	.type	32;	.endef
_print_var:
LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_string
	movl	$LC0, (%esp)
	call	_print_string
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_print_int
	movl	$LC1, (%esp)
	call	_print_string
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	$1, 12(%esp)
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_print_string;	.scl	2;	.type	32;	.endef
	.def	_print_int;	.scl	2;	.type	32;	.endef
