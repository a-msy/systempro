        .text
        .align 2
main:
        li      $a0,72
putc:
        lw      $t0,0xffff0008
        li      $t1,1
        and     $t0,$t0,$t1
        beqz    $t0,putc
        sw      $a0,0xffff000c
        li      $a0,101
putc2:
        lw      $t0,0xffff0008
        li      $t1,1
        and     $t0,$t0,$t1
        beqz    $t0,putc2
        sw      $a0,0xffff000c
        li      $a0,108
putc3:
        lw      $t0,0xffff0008
        li      $t1,1
        and     $t0,$t0,$t1
        beqz    $t0,putc3
        sw      $a0,0xffff000c
        li      $a0,108
putc4:
        lw      $t0,0xffff0008
        li      $t1,1
        and     $t0,$t0,$t1
        beqz    $t0,putc4
        sw      $a0,0xffff000c
        li      $a0,111
putc5:
        lw      $t0,0xffff0008
        li      $t1,1
        and     $t0,$t0,$t1
        beqz    $t0,putc5
        sw      $a0,0xffff000c
        j       $ra

