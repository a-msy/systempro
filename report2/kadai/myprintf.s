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
_my_strlen:
	subu	$sp,$sp,16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$zero,0($fp)
$L3:
	lw	$v0,16($fp)
	lbu	$v1,0($v0)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	sll	$v0,$v1,24
	sra	$v0,$v0,24
	bne	$v0,$zero,$L5
	j	$L4
$L5:
	lw	$v0,0($fp)
	addu	$v0,$v0,1
	sw	$v0,0($fp)
	j	$L3
$L4:
	lw	$v0,0($fp)
	move	$sp,$fp
	lw	$fp,8($sp)
	addu	$sp,$sp,16
	j	$ra
	.align	2
_mystrchr:
	subu	$sp,$sp,16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$a1,20($fp)
	lbu	$v0,20($fp)
	sb	$v0,0($fp)
$L7:
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L9
	j	$L8
$L9:
	lw	$v0,16($fp)
	lb	$v1,0($v0)
	lb	$v0,0($fp)
	bne	$v1,$v0,$L10
	lw	$v0,16($fp)
	j	$L6
$L10:
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L7
$L8:
	move	$v0,$zero
$L6:
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
	beq	$v0,$zero,$L13
	lw	$v0,24($fp)
	sw	$v0,120($fp)
$L13:
	.set	noreorder
	nop
	.set	reorder
$L14:
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
	beq	$v0,$zero,$L16
	lw	$v0,112($fp)
	sw	$v0,124($fp)
	lw	$v1,124($fp)
	sw	$v1,128($fp)
	lw	$a0,128($fp)
	bgez	$a0,$L18
	lw	$v0,128($fp)
	addu	$v0,$v0,3
	sw	$v0,128($fp)
$L18:
	lw	$v1,128($fp)
	sra	$v0,$v1,2
	sll	$v0,$v0,2
	lw	$a0,124($fp)
	subu	$v1,$a0,$v0
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L16
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
$L16:
	lw	$v1,144($fp)
	lw	$v0,148($fp)
	div	$0,$v1,$v0
	mflo	$v0
	sw	$v0,144($fp)
	bne	$v0,$zero,$L14
	lw	$v1,152($fp)
	lw	$v0,112($fp)
	subu	$v0,$v1,$v0
	sw	$v0,152($fp)
	lw	$v0,160($fp)
	andi	$v0,$v0,0x40
	bne	$v0,$zero,$L20
	lw	$v0,160($fp)
	andi	$v0,$v0,0x2
	beq	$v0,$zero,$L21
	li	$v0,48			# 0x30
	sw	$v0,116($fp)
$L21:
	.set	noreorder
	nop
	.set	reorder
$L22:
	lw	$v0,152($fp)
	bgtz	$v0,$L24
	j	$L20
$L24:
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
	j	$L22
$L20:
	lb	$v0,16($fp)
	beq	$v0,$zero,$L25
	lw	$v1,148($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L25
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
$L25:
	lw	$v0,160($fp)
	andi	$v0,$v0,0x4
	beq	$v0,$zero,$L26
	lw	$v1,148($fp)
	li	$v0,8			# 0x8
	bne	$v1,$v0,$L27
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
	j	$L26
$L27:
	lw	$v1,148($fp)
	li	$v0,16			# 0x10
	bne	$v1,$v0,$L26
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
$L26:
	.set	noreorder
	nop
	.set	reorder
$L30:
	lw	$v0,112($fp)
	bgtz	$v0,$L32
	j	$L31
$L32:
	lw	$v0,112($fp)
	addu	$v0,$v0,-1
	move	$v1,$v0
	sw	$v1,112($fp)
	addu	$v0,$fp,32
	addu	$v0,$v0,$v1
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	j	$L30
$L31:
	.set	noreorder
	nop
	.set	reorder
$L33:
	lw	$v0,152($fp)
	bgtz	$v0,$L35
	j	$L34
$L35:
	lw	$v0,152($fp)
	addu	$v0,$v0,-1
	sw	$v0,152($fp)
	lb	$v0,116($fp)
	move	$a0,$v0
	jal	_print_char
	j	$L33
$L34:
	move	$sp,$fp
	lw	$ra,140($sp)
	lw	$fp,136($sp)
	addu	$sp,$sp,144
	j	$ra
	.rdata
	.align	2
$LC2:
	.asciiz	"'-+ #0"
	.align	2
$LC3:
	.asciiz	"(null)"
	.text
	.align	2
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,72
	sw	$ra,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	addu	$v0,$fp,76
	sw	$v0,24($fp)
$L37:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L39
	j	$L38
$L39:
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sb	$zero,44($fp)
	sw	$zero,48($fp)
	lw	$v0,72($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L40
	lw	$v0,72($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
$L41:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	la	$a0,$LC2
	move	$a1,$v0
	jal	_mystrchr
	bne	$v0,$zero,$L43
	j	$L42
$L43:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	addu	$v0,$v0,-32
	sw	$v0,52($fp)
	lw	$v1,52($fp)
	sltu	$v0,$v1,17
	beq	$v0,$zero,$L44
	lw	$v0,52($fp)
	sll	$v1,$v0,2
	la	$v0,$L51
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	j	$v0
	.rdata
	.align	3
$L51:
	.word	$L50
	.word	$L44
	.word	$L44
	.word	$L48
	.word	$L44
	.word	$L44
	.word	$L44
	.word	$L45
	.word	$L44
	.word	$L44
	.word	$L44
	.word	$L47
	.word	$L44
	.word	$L46
	.word	$L44
	.word	$L44
	.word	$L49
	.text
$L45:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x8
	sw	$v0,28($fp)
	j	$L44
$L46:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x40
	sw	$v0,28($fp)
	j	$L44
$L47:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x20
	sw	$v0,28($fp)
	li	$v0,43			# 0x2b
	sb	$v0,44($fp)
	j	$L44
$L48:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x4
	sw	$v0,28($fp)
	j	$L44
$L49:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x2
	sw	$v0,28($fp)
	j	$L44
$L50:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x20
	sw	$v0,28($fp)
	li	$v0,32			# 0x20
	sb	$v0,44($fp)
$L44:
	lw	$v0,72($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
	j	$L41
$L42:
	.set	noreorder
	nop
	.set	reorder
$L53:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L54
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L55
	j	$L54
$L55:
	lw	$v1,32($fp)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$a0,$v0,1
	lw	$v1,72($fp)
	lb	$v0,0($v1)
	addu	$v0,$a0,$v0
	addu	$v0,$v0,-48
	sw	$v0,32($fp)
	addu	$v1,$v1,1
	sw	$v1,72($fp)
	j	$L53
$L54:
	lw	$v0,72($fp)
	lb	$v1,0($v0)
	li	$v0,46			# 0x2e
	bne	$v1,$v0,$L57
	lw	$v0,72($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
	lw	$v0,72($fp)
	lb	$v1,0($v0)
	li	$v0,42			# 0x2a
	bne	$v1,$v0,$L58
	lw	$v0,72($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	sw	$v0,36($fp)
	j	$L57
$L58:
$L60:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L57
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L62
	j	$L57
$L62:
	lw	$v1,36($fp)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$a0,$v0,1
	lw	$v1,72($fp)
	lb	$v0,0($v1)
	addu	$v0,$a0,$v0
	addu	$v0,$v0,-48
	sw	$v0,36($fp)
	addu	$v1,$v1,1
	sw	$v1,72($fp)
	j	$L60
$L57:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	sw	$v0,56($fp)
	li	$v0,105			# 0x69
	lw	$v1,56($fp)
	beq	$v1,$v0,$L66
	lw	$v1,56($fp)
	slt	$v0,$v1,106
	beq	$v0,$zero,$L88
	li	$v0,99			# 0x63
	lw	$v1,56($fp)
	beq	$v1,$v0,$L81
	lw	$v1,56($fp)
	slt	$v0,$v1,100
	beq	$v0,$zero,$L89
	li	$v0,37			# 0x25
	lw	$v1,56($fp)
	beq	$v1,$v0,$L82
	li	$v0,88			# 0x58
	lw	$v1,56($fp)
	beq	$v1,$v0,$L83
	j	$L91
$L89:
	li	$v0,100			# 0x64
	lw	$v1,56($fp)
	beq	$v1,$v0,$L66
	j	$L91
$L88:
	li	$v0,115			# 0x73
	lw	$v1,56($fp)
	beq	$v1,$v0,$L68
	lw	$v1,56($fp)
	slt	$v0,$v1,116
	beq	$v0,$zero,$L90
	li	$v0,111			# 0x6f
	lw	$v1,56($fp)
	beq	$v1,$v0,$L85
	j	$L91
$L90:
	li	$v0,120			# 0x78
	lw	$v1,56($fp)
	beq	$v1,$v0,$L84
	j	$L91
$L66:
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	bgez	$v0,$L67
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	subu	$v0,$zero,$v0
	sw	$v0,0($v1)
	li	$v0,45			# 0x2d
	sb	$v0,44($fp)
$L67:
	lw	$v1,24($fp)
	lb	$a3,44($fp)
	lw	$v0,28($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,10			# 0xa
	lw	$a2,32($fp)
	jal	_put_int
	lw	$v0,24($fp)
	addu	$v0,$v0,4
	sw	$v0,24($fp)
	j	$L91
$L68:
	lw	$v0,24($fp)
	lw	$v0,0($v0)
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L69
	la	$v0,$LC3
	sw	$v0,48($fp)
$L69:
	lw	$a0,48($fp)
	jal	_my_strlen
	sw	$v0,40($fp)
	lw	$v0,36($fp)
	beq	$v0,$zero,$L70
	lw	$v0,36($fp)
	lw	$v1,40($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L70
	lw	$v0,36($fp)
	sw	$v0,40($fp)
$L70:
	lw	$v1,32($fp)
	lw	$v0,40($fp)
	subu	$v0,$v1,$v0
	sw	$v0,32($fp)
	lw	$v0,28($fp)
	andi	$v0,$v0,0x40
	bne	$v0,$zero,$L71
$L72:
	lw	$v0,32($fp)
	bgtz	$v0,$L74
	j	$L71
$L74:
	lw	$v0,32($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	li	$a0,32			# 0x20
	jal	_print_char
	j	$L72
$L71:
	.set	noreorder
	nop
	.set	reorder
$L75:
	lw	$v0,40($fp)
	addu	$v0,$v0,-1
	move	$v1,$v0
	sw	$v1,40($fp)
	li	$v0,-1			# 0xffffffff
	bne	$v1,$v0,$L77
	j	$L76
$L77:
	addu	$v0,$fp,48
	lw	$v1,0($v0)
	lb	$a0,0($v1)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
	jal	_print_char
	j	$L75
$L76:
	.set	noreorder
	nop
	.set	reorder
$L78:
	lw	$v0,32($fp)
	bgtz	$v0,$L80
	lw	$v0,24($fp)
	addu	$v0,$v0,4
	sw	$v0,24($fp)
	j	$L91
$L80:
	lw	$v0,32($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	li	$a0,32			# 0x20
	jal	_print_char
	j	$L78
$L81:
	lw	$v0,24($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,24($fp)
	addu	$v0,$v0,4
	sw	$v0,24($fp)
	j	$L91
$L82:
	li	$a0,37			# 0x25
	jal	_print_char
	j	$L91
$L83:
	lw	$v0,28($fp)
	ori	$v0,$v0,0x10
	sw	$v0,28($fp)
$L84:
	lw	$v1,24($fp)
	lb	$a3,44($fp)
	lw	$v0,28($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,16			# 0x10
	lw	$a2,32($fp)
	jal	_put_int
	lw	$v0,24($fp)
	addu	$v0,$v0,4
	sw	$v0,24($fp)
	j	$L91
$L85:
	lw	$v1,24($fp)
	lb	$a3,44($fp)
	lw	$v0,28($fp)
	sw	$v0,16($sp)
	lw	$a0,0($v1)
	li	$a1,8			# 0x8
	lw	$a2,32($fp)
	jal	_put_int
	lw	$v0,24($fp)
	addu	$v0,$v0,4
	sw	$v0,24($fp)
	j	$L91
$L40:
	lw	$v0,72($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L91:
	lw	$v0,72($fp)
	addu	$v0,$v0,1
	sw	$v0,72($fp)
	j	$L37
$L38:
	move	$sp,$fp
	lw	$ra,68($sp)
	lw	$fp,64($sp)
	addu	$sp,$sp,72
	j	$ra
	.rdata
	.align	2
$LC4:
	.asciiz	"TEST\n"
	.align	2
$LC5:
	.ascii	"%%d:%d\n"
	.ascii	"%%5d:%5d\n"
	.asciiz	"%%-5d:%-5d\n"
	.align	2
$LC6:
	.ascii	"%%x:%x\n"
	.asciiz	"%%X:%X\n"
	.align	2
$LC7:
	.asciiz	"%%o:%o\n"
	.align	2
$LC8:
	.ascii	"%%s:%s\n"
	.ascii	"%%5s:%5s\n"
	.asciiz	"%%5.2s:%5.2s\n"
	.align	2
$LC9:
	.asciiz	"Say"
	.align	2
$LC10:
	.asciiz	"%%c:%c\n"
	.text
	.align	2
main:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	la	$a0,$LC4
	jal	_myprintf
	la	$a0,$LC5
	li	$a1,100			# 0x64
	li	$a2,100			# 0x64
	li	$a3,100			# 0x64
	jal	_myprintf
	la	$a0,$LC6
	li	$a1,15			# 0xf
	li	$a2,15			# 0xf
	jal	_myprintf
	la	$a0,$LC7
	li	$a1,15			# 0xf
	jal	_myprintf
	la	$a0,$LC8
	la	$a1,$LC9
	la	$a2,$LC9
	la	$a3,$LC9
	jal	_myprintf
	la	$a0,$LC10
	li	$a1,97			# 0x61
	jal	_myprintf
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
