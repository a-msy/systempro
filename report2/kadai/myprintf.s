	.file	1 "myprintf.c"

 # -G value = 0, Arch = r2000, ISA = 1
 # GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2) (mipsel-linux) compiled by GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2).
 # options passed:  -mno-abicalls -mrnames -mmips-as
 # -mno-check-zero-division -march=r2000 -O0 -fleading-underscore
 # -finhibit-size-directive -fverbose-asm
 # options enabled:  -fpeephole -ffunction-cse -fkeep-static-consts
 # -fpcc-struct-return -fsched-interblock -fsched-spec -fbranch-count-reg
 # -fnew-exceptions -fcommon -finhibit-size-directive -fverbose-asm
 # -fgnu-linker -fargument-alias -fleading-underscore -fident -fmath-errno
 # -mrnames -mno-check-zero-division -march=r2000


	.text
	.align	2
_mystrchr:
	subu	$sp,$sp,16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$a1,20($fp)
	lbu	$v0,20($fp)
	sb	$v0,0($fp)
$L3:
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L5
	j	$L4
$L5:
	lw	$v0,16($fp)
	lb	$v1,0($v0)
	lb	$v0,0($fp)
	bne	$v1,$v0,$L6
	lw	$v0,16($fp)
	j	$L2
$L6:
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L3
$L4:
	move	$v0,$zero
$L2:
	move	$sp,$fp
	lw	$fp,8($sp)
	addu	$sp,$sp,16
	j	$ra
	.align	2
_print_char:
	subu	$sp,$sp,40
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	move	$v0,$a0
	sb	$v0,16($fp)
	lbu	$v0,16($fp)
	sb	$v0,24($fp)
	sb	$zero,25($fp)
	addu	$v0,$fp,24
	move	$a0,$v0
	jal	_print_string
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	addu	$sp,$sp,40
	j	$ra
	.rdata
	.align	2
$LC0:
	.asciiz	"0123456789abcdef"
	.align	2
$LC1:
	.asciiz	"0123456789ABCDEF"
	.text
	.align	2
_put_int:
	subu	$sp,$sp,144
	sw	$ra,140($sp)
	sw	$fp,136($sp)
	move	$fp,$sp
	sw	$a0,144($fp)
	sw	$a1,148($fp)
	sw	$a2,152($fp)
	move	$v0,$a3
	sb	$v0,16($fp)
	la	$v0,$LC0
	sw	$v0,20($fp)
	la	$v0,$LC1
	sw	$v0,24($fp)
	sw	$zero,112($fp)
	li	$v0,32			# 0x20
	sw	$v0,116($fp)
	lw	$v0,20($fp)
	sw	$v0,120($fp)
	lw	$v0,160($fp)
	andi	$v0,$v0,0x10
	beq	$v0,$zero,$L9
	lw	$v0,24($fp)
	sw	$v0,120($fp)
$L9:
	.set	noreorder
	nop
	.set	reorder
$L10:
	addu	$a2,$fp,112
	lw	$a0,0($a2)
	addu	$v0,$fp,32
	move	$v1,$v0
	move	$v0,$a0
	addu	$a1,$v1,$v0
	lw	$v1,144($fp)
	lw	$v0,148($fp)
	div	$0,$v1,$v0
	mfhi	$v1
	lw	$v0,120($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a1)
	addu	$a0,$a0,1
	sw	$a0,0($a2)
	lw	$v0,160($fp)
	andi	$v0,$v0,0x8
	beq	$v0,$zero,$L12
	lw	$v0,112($fp)
	sw	$v0,124($fp)
	lw	$v1,124($fp)
	sw	$v1,128($fp)
	lw	$a0,128($fp)
	bgez	$a0,$L14
	lw	$v0,128($fp)
	addu	$v0,$v0,3
	sw	$v0,128($fp)
$L14:
	lw	$v1,128($fp)
	sra	$v0,$v1,2
	sll	$v0,$v0,2
	lw	$a0,124($fp)
	subu	$v1,$a0,$v0
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L12
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	li	$v0,44			# 0x2c
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
$L12:
	lw	$v1,144($fp)
	lw	$v0,148($fp)
	div	$0,$v1,$v0
	mflo	$v0
	sw	$v0,144($fp)
	bne	$v0,$zero,$L10
	lw	$v1,152($fp)
	lw	$v0,112($fp)
	subu	$v0,$v1,$v0
	sw	$v0,152($fp)
	lw	$v0,160($fp)
	andi	$v0,$v0,0x40
	bne	$v0,$zero,$L16
	lw	$v0,160($fp)
	andi	$v0,$v0,0x2
	beq	$v0,$zero,$L17
	li	$v0,48			# 0x30
	sw	$v0,116($fp)
$L17:
	.set	noreorder
	nop
	.set	reorder
$L18:
	lw	$v0,152($fp)
	bgtz	$v0,$L20
	j	$L16
$L20:
	lw	$v0,152($fp)
	addu	$v0,$v0,-1
	sw	$v0,152($fp)
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	lbu	$v0,116($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	j	$L18
$L16:
	lb	$v0,16($fp)
	beq	$v0,$zero,$L21
	lw	$v1,148($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L21
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	lbu	$v0,16($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
$L21:
	lw	$v0,160($fp)
	andi	$v0,$v0,0x4
	beq	$v0,$zero,$L22
	lw	$v1,148($fp)
	li	$v0,8			# 0x8
	bne	$v1,$v0,$L23
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	li	$v0,48			# 0x30
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	j	$L22
$L23:
	lw	$v1,148($fp)
	li	$v0,16			# 0x10
	bne	$v1,$v0,$L22
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	li	$v0,120			# 0x78
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	addu	$a1,$fp,112
	lw	$v1,0($a1)
	addu	$v0,$fp,32
	move	$a0,$v0
	move	$v0,$v1
	addu	$a0,$a0,$v0
	li	$v0,48			# 0x30
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
$L22:
	.set	noreorder
	nop
	.set	reorder
$L26:
	lw	$v0,112($fp)
	bgtz	$v0,$L28
	j	$L27
$L28:
	lw	$v0,112($fp)
	addu	$v0,$v0,-1
	move	$v1,$v0
	sw	$v1,112($fp)
	addu	$v0,$fp,32
	addu	$v0,$v0,$v1
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	j	$L26
$L27:
	.set	noreorder
	nop
	.set	reorder
$L29:
	lw	$v0,152($fp)
	bgtz	$v0,$L31
	j	$L30
$L31:
	lw	$v0,152($fp)
	addu	$v0,$v0,-1
	sw	$v0,152($fp)
	lb	$v0,116($fp)
	move	$a0,$v0
	jal	_print_char
	j	$L29
$L30:
	move	$sp,$fp
	lw	$ra,140($sp)
	lw	$fp,136($sp)
	addu	$sp,$sp,144
	j	$ra
	.rdata
	.align	2
$LC2:
	.asciiz	"'-+ #0"
	.text
	.align	2
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,64
	sw	$ra,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sb	$zero,40($fp)
	addu	$v0,$fp,68
	sw	$v0,44($fp)
$L33:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L35
	j	$L34
$L35:
	lw	$v0,64($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L36
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
$L37:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	la	$a0,$LC2
	move	$a1,$v0
	jal	_mystrchr
	bne	$v0,$zero,$L39
	j	$L38
$L39:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	addu	$v0,$v0,-32
	sw	$v0,48($fp)
	lw	$v1,48($fp)
	sltu	$v0,$v1,17
	beq	$v0,$zero,$L40
	lw	$v0,48($fp)
	sll	$v1,$v0,2
	la	$v0,$L47
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	3
$L47:
	.word	$L46
	.word	$L40
	.word	$L40
	.word	$L44
	.word	$L40
	.word	$L40
	.word	$L40
	.word	$L41
	.word	$L40
	.word	$L40
	.word	$L40
	.word	$L43
	.word	$L40
	.word	$L42
	.word	$L40
	.word	$L40
	.word	$L45
	.text
$L41:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x8
	sw	$v0,24($fp)
	j	$L40
$L42:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x40
	sw	$v0,24($fp)
	j	$L40
$L43:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x20
	sw	$v0,24($fp)
	li	$v0,43			# 0x2b
	sb	$v0,40($fp)
	j	$L40
$L44:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x4
	sw	$v0,24($fp)
	j	$L40
$L45:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x2
	sw	$v0,24($fp)
	j	$L40
$L46:
	lw	$v0,24($fp)
	ori	$v0,$v0,0x20
	sw	$v0,24($fp)
	li	$v0,32			# 0x20
	sb	$v0,40($fp)
$L40:
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
	j	$L37
$L38:
	.set	noreorder
	nop
	.set	reorder
$L49:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L50
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L51
	j	$L50
$L51:
	lw	$v1,28($fp)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$a0,$v0,1
	lw	$v1,64($fp)
	lb	$v0,0($v1)
	addu	$v0,$a0,$v0
	addu	$v0,$v0,-48
	sw	$v0,28($fp)
	addu	$v1,$v1,1
	sw	$v1,64($fp)
	j	$L49
$L50:
	lw	$v0,64($fp)
	lb	$v1,0($v0)
	li	$v0,46			# 0x2e
	bne	$v1,$v0,$L53
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
	lw	$v0,64($fp)
	lb	$v1,0($v0)
	li	$v0,42			# 0x2a
	bne	$v1,$v0,$L54
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
	lw	$v0,44($fp)
	lw	$v0,0($v0)
	sw	$v0,32($fp)
	j	$L53
$L54:
$L56:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L53
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L58
	j	$L53
$L58:
	lw	$v1,32($fp)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$a0,$v0,1
	lw	$v1,64($fp)
	lb	$v0,0($v1)
	addu	$v0,$a0,$v0
	addu	$v0,$v0,-48
	sw	$v0,32($fp)
	addu	$v1,$v1,1
	sw	$v1,64($fp)
	j	$L56
$L53:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	sw	$v0,52($fp)
	li	$v0,111			# 0x6f
	lw	$v1,52($fp)
	beq	$v1,$v0,$L67
	lw	$v1,52($fp)
	slt	$v0,$v1,112
	beq	$v0,$zero,$L70
	li	$v0,99			# 0x63
	lw	$v1,52($fp)
	beq	$v1,$v0,$L64
	lw	$v1,52($fp)
	slt	$v0,$v1,100
	beq	$v0,$zero,$L71
	li	$v0,37			# 0x25
	lw	$v1,52($fp)
	beq	$v1,$v0,$L65
	j	$L72
$L71:
	li	$v0,100			# 0x64
	lw	$v1,52($fp)
	beq	$v1,$v0,$L61
	j	$L72
$L70:
	li	$v0,115			# 0x73
	lw	$v1,52($fp)
	beq	$v1,$v0,$L63
	li	$v0,120			# 0x78
	lw	$v1,52($fp)
	beq	$v1,$v0,$L66
	j	$L72
$L61:
	lw	$v0,44($fp)
	lw	$v0,0($v0)
	bgez	$v0,$L62
	lw	$v1,44($fp)
	lw	$v0,44($fp)
	lw	$v0,0($v0)
	subu	$v0,$zero,$v0
	sw	$v0,0($v1)
	li	$v0,45			# 0x2d
	sb	$v0,40($fp)
$L62:
	lw	$v1,44($fp)
	lb	$a3,40($fp)
	lw	$v0,24($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,10			# 0xa
	lw	$a2,28($fp)
	jal	_put_int
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L63:
	lw	$v0,44($fp)
	lw	$a0,0($v0)
	jal	_print_string
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L64:
	lw	$v0,44($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L65:
	li	$a0,37			# 0x25
	jal	_print_char
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L66:
	lw	$v1,44($fp)
	lb	$a3,40($fp)
	lw	$v0,24($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,16			# 0x10
	lw	$a2,28($fp)
	jal	_put_int
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L67:
	lw	$v1,44($fp)
	lb	$a3,40($fp)
	lw	$v0,24($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,8			# 0x8
	lw	$a2,28($fp)
	jal	_put_int
	lw	$v0,44($fp)
	addu	$v0,$v0,4
	sw	$v0,44($fp)
	j	$L72
$L36:
	lw	$v0,64($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L72:
	lw	$v0,64($fp)
	addu	$v0,$v0,1
	sw	$v0,64($fp)
	j	$L33
$L34:
	move	$sp,$fp
	lw	$ra,60($sp)
	lw	$fp,56($sp)
	addu	$sp,$sp,64
	j	$ra
	.rdata
	.align	2
$LC3:
	.asciiz	"TEST %05d is %c %5s ...%%s\n"
	.align	2
$LC4:
	.asciiz	"OK"
	.align	2
$LC5:
	.asciiz	"16:%x\n"
	.align	2
$LC6:
	.asciiz	"8:%o\n"
	.text
	.align	2
main:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	la	$a0,$LC3
	li	$a1,999			# 0x3e7
	li	$a2,120			# 0x78
	la	$a3,$LC4
	jal	_myprintf
	la	$a0,$LC5
	li	$a1,15			# 0xf
	jal	_myprintf
	la	$a0,$LC6
	li	$a1,15			# 0xf
	jal	_myprintf
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
