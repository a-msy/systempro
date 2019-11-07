# ループ処理で関数呼出しをした例

        .text
        .align 2

main:
        move    $s0, $ra                # main を呼んだ戻り先の
                                        # アドレスが入っている $ra
                                        # を $s0 に保存しておく

        la      $t2, msg                 # msg のアドレスを $t2 に
loop:   lb      $a0, 0($t2)              # $t2 の中の 1バイトを $a0に
        beqz    $a0, out                 # if ($a0 == 0) goto out
        jal     putc
        addu    $t2, $t2, 1              # $t2 を次に進める
        j       loop
out:
        move    $ra, $s0                 # 戻り先を $ra に入れる
        j       $ra                      # mainを呼んだ戻り先に飛ぶ

        .data
        .align 2
msg:
#       .byte 'H', 'e', 'l', 'l', 'o', 0
#       .byte 72, 101, 108, 108, 111, 0
#       .ascii "Hello\000"
        .asciiz "Hello"

        .text
        .align 2

putc:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a
        j       $ra
