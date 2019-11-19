        .data
        .align 2
space:
        .asciiz " "
enter:
        .asciiz "\n"
        
        .text
        .align 2        
test_prime:
        subu    $sp,$sp,32      #スタックポインター
        sw      $ra,20($sp)     #$ra
        sw      $fp,16($sp)     #フレームポインター
        addiu   $fp,$sp,28      #フレームポインターのセット
        li      $t0,2           # 1は素数ではないから２を初期値にセット
prime_for:
        beq     $t0, $a0, return1       # return　1 もし n が素数なら (i==n)
        bgt     $t0, $a0, prime_exit    # forループを抜ける． もし n > i　なら．
        rem     $t1, $a0, $t0           # $t1 = n % i　ｎをiで割ったあまり
        beqz    $t1, prime_exit         # goto Exit_prime if $t1 == 0
        addi    $t0, $t0, 1             # i++
        j       prime_for               # 再びループへ
return1:
        li      $v0,1           #もしnが素数なら１を代入して返す
        lw      $ra,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,32
        j       $ra             #mainへ戻る
prime_exit:
        li      $v0,0           #もしnが素数でないなら０を代入して返す
        lw      $ra,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,32
        j       $ra             #ループを抜ける
main:
        subu    $sp,$sp,32      #stackpointer
        sw      $ra,20($sp)     #$ra
        sw      $fp,16($sp)     #flamepointer
        addiu   $fp,$sp,28      #set fp
        li      $s0,100         #最大ループ回数　(match<100)
        li      $s1,0           #現在のループ回数　(match)
        li      $s2,2           #チェック用の数値 n (n=2)
        li      $s3,1           #test_prime(n) == $s3
        li      $s4,10          #10個表示されたら改行するため．print  \n   
while:  
        beq     $s0,$s1,exit    # s1 == 100 ならば（０～９９まで），exitに行く
        move    $a0,$s2         # $s2 => $a0に移動
        jal     test_prime        
        bne     $v0,$s3,else    # $v0 != 1 test_primeから帰ってきた数値で検証する       
        move    $a0,$s2         # 印刷のために，数字を入れる
        li      $v0,1           #１はint
        syscall        
        la      $a0, space      # 空白を印刷
        li      $v0,4           #４は文字列
        syscall        
        addiu   $s1,$s1,1               #現在のループ回数を増加       
        rem     $t2, $s1, $s4           # $t2 = n % i____１０個表示されたかどうか
        beqz    $t2, print_enter        # 改行表示　もし $t2（個数） == 0        
else:   
        addiu   $s2, $s2, 1             # n = n + 1 
        j       while                   # whileループを繰り返す
exit:   
        lw      $ra, 20($sp)    # Restore return address
        lw      $fp, 16($sp)    # Restore frame pointer
        addiu   $sp, $sp, 32    # Pop stack frame
        j       $ra             # End this program        
print_enter:
        subu    $sp,$sp,32      #stackpointer
        sw      $ra,20($sp)     #$ra
        sw      $fp,16($sp)     #flamepointer
        addiu   $fp,$sp,28      #set fp
        la      $a0,enter
        li      $v0,4
        syscall
        lw      $ra, 20($sp)    # Restore return address
        lw      $fp, 16($sp)    # Restore frame pointer
        addiu   $sp, $sp, 32    # Pop stack frame
        j       $ra             #return
