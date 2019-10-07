        .text       #text segment
        .align 2    #4byte

main:
        move    $a0,$zero   #$a0 : sum = 0
        li      $v1,1       #$v1 : count = 1

loop:
        addu    $a0,$a0,$v1 #sum += count
        addu    $v1,$v1,1   #count++
        slt     $v0,$v1,6   #$v0 = count < 6 ? 1 : 0
        bnez    $v0,loop    #if($v0 != 0) goto loop
        move    $t0,$a0     #$t0 = sum
        j       $ra         #return
