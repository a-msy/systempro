        .text
        .align 2

main:   addu    $t1,$zero,$zero
        addu    $t0,$zero,$zero
        
loop:   beq     $t1,5,print
        li      $v0,5
        syscall
        addu    $t0,$t0,$v0
        addu    $t1,$t1,1
        j       loop
        
print:  li      $v0,1
        move    $a0,$t0
        syscall
        j       $ra
