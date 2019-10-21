# 文字リテラルを使って読みやすくした例
        .text
        .align 2

main:
        move    $s0, $ra                # main を呼んだ戻り先の
                                        # アドレスが入っている $ra
                                        # を $s0 に保存しておく

        li      $a0, 'H'                # $a0 に引数 'H' == 72
        jal     putc                    # putc を呼ぶ
        li      $a0, 'e'                # $a0 に引数 'e' == 101
        jal     putc                    # putc を呼ぶ
        li      $a0, 'l'                # $a0 に引数 'l' == 108
        jal     putc                    # putc を呼ぶ
        li      $a0, 'l'                # $a0 に引数 'l' == 108
        jal     putc                    # putc を呼ぶ
        li      $a0, 'o'                # $a0 に引数 'o' == 111
        jal     putc                    # putc を呼ぶ

        move    $ra, $s0                # $s0 に保存しておいた
                                        # 戻り先を $ra に入れる

        j       $ra                     # mainを呼んだ戻り先に飛ぶ

putc:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a
        j       $ra
