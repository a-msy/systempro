array:
        .space 400      #400バイト分（１００個分）の配列用意
        
        .data
        .align 2
space:
        .asciiz " "
enter:
        .asciiz "\n"
start:      
        .asciiz "To quit, type 0\n\n"
        
mark:
        .asciiz "\n> "
owari:
        .asciiz "\nGood bye :)\n\n"
excep:
        .asciiz "\nPlease type correct number\n"

        
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
        subu    $sp,$sp,32      #　stackpointer
        sw      $ra,20($sp)     #　$ra
        sw      $fp,16($sp)     #　flamepointer
        addiu   $fp,$sp,28      #　set fp
        li      $v0, 4          # syscall of print_string
        la      $a0, start      # startラベルの内容を入れる
        syscall                 # 印刷内容　"To quit, type 0"
        li      $s0,100         #最大ループ回数　(match<100)
        li      $s1,0           #現在のループ回数　(match)
        li      $s2,2           #チェック用の数値 n (n=2)
        li      $s3,1           #test_prime(n) == $s3
        la      $a1,array       #$a1にarrayのアドレスを入れる
while:  
        beq     $s0,$s1,exit    # s1 == 100 ならば（０～９９まで），exitに行く
        move    $a0,$s2         # $s2 => $a0に移動
        jal     test_prime       
        bne     $v0,$s3,else    # $v0 != 1 test_primeから帰ってきた数値で検証する
        li      $t4, 4          # For array を増加（４バイト単位）
        addu    $a1, $a1, $t4   # $a1 = $a1 + 4
        sw      $s2, 0($a1)     # $s2（素数）=>$a1が指すアドレスの中の先頭にいれる   
        addiu   $s1,$s1,1       #　現在のループ回数を増加      
else:   
        addiu   $s2, $s2, 1     # n = n + 1 
        j       while           # go to Loop
exit:   
        li      $v0, 4          # syscall of print_string
        la      $a0, mark       # 印字内容　">"
        syscall                 # 印刷
        la      $a1, array      # Initialize $a1
        li      $v0, 5          # For syscall of read_int
        syscall                 # 何番目の素数かを入力する       
        beqz    $v0,end         #　0か文字なら終了
        bltz    $v0,error       # 負ならエラー
        bgtu    $v0,$s0,error   #　１００より大きくてもエラー    
        move    $t3, $v0        # 入力された値$v0を $t3　に
        addu    $t3, $t3, $t3   # $t3 = $t3 * 2
        addu    $t3, $t3, $t3   # $t3 = $t3 * 2　４バイト分になる
        addu    $a1, $a1, $t3   # $a1 = $a1       
        lw      $a0, 0($a1)     # $a1 のアドレスから 4バイト(word)取り出して $a0 に代入(load)
        li      $v0, 1          # For syscall of print_int
        syscall                 # Print prime       
        j       exit
error:
        li    $v0, 4            # for syscall of print_string
        la    $a0, excep        # Print error message
        syscall                 # print
        j     exit 
end:
        li      $v0, 4          # for syscall of print_string
        la      $a0, owari      # good,bye
        syscall                 # print       
        lw      $ra, 20($sp)    # Restore return address
        lw      $fp, 16($sp)    # Restore frame pointer
        addiu   $sp, $sp, 32    # Pop stack frame       
        j       $ra             # End this program
