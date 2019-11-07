        .text
        .align 2

main:   li      $t1,$zero #t1を０で初期化
        li      $t0,$zero #t0を０で初期化
        
loop:   beq     $t1,2,print     #if(t1==5) go to print
        li      $v0,5           #v0 read_int(input from user)
        syscall
        addu    $t0,$t0,$v0     #t0=t0+v0(return value)
        addu    $t1,$t1,1       #t1++
        j       loop            #jump to loop
        
print:  li      $v0,1           #print_int
        move    $a0,$t0         #a0 <= t0 (引数)
        syscall
        j       $ra             #return 0
