        .data
        .align 2
str:
        .ascii "The factorial of 10 is "
        .text
        .align 2
print_int:
        li      $v0,1
        syscall
        j       $ra
print_str:
        li      $v0,4
        syscall
        j       $ra        
main:
        subu    $sp,$sp,32  #スタックフレームは３２バイト長で確保をする
        sw      $ra,20($sp) #戻りアドレスを退避させる
        sw      $fp,16($sp) #古いフレームポインタを退避
        addiu   $fp,$sp,28  #新しくフレームポインタを設定
        #factを呼び出して戻ってから、syscallで$LCとfactの返り値をプリントする
        li      $a0,10      #引数は10
        jal     fact
        move    $t1,$v0     #返り値をt1に退避       
        la      $a0,str     #a0にテンプレ文のアドレスを記入
        jal     print_str        
        move    $a0,$t1     #factの返り値を保存したt1を$a0に収める
        jal     print_int
        #退避してあったレジスタを復元したあと呼出側へ戻る
        lw      $ra,20($sp) #戻りアドレスを復元
        lw      $fp,16($sp) #フレームポインタを復元
        addiu   $sp,$sp,32  #スタックポインタをポップする
        j       $ra
fact:
        subu    $sp,$sp,32  #スタックフレームは３２バイト長
        sw      $ra,20($sp) #戻りアドレスを退避させる
        sw      $fp,16($sp) #古いフレームポインタを退避
        addiu   $fp,$sp,28  #新しくフレームポインタを設定
        sw      $a0,0($fp)  #引数を退避させる# 28($sp)にもってきているもの
        #引数＞０かどうかを調べる。
        #引数＜＝０なら１を返す。
        #引数＞０ならfactルーチンを呼出(n-1)を計算し、その結果にnをかける
        #上記を再帰的に繰り返す
        lw      $v0,0($fp)  #nをroadさせておく
        bgtz    $v0,factsub #引数が0より大きければ再帰処理に飛ぶ
        li      $v0,1       #0以下なら１
        j       return
factsub:
        lw      $v1,0($fp)  #nをロードする
        subu    $v0,$v1,1   #n-1
        move    $a0,$v0     #a0にn-1に戻る
        jal     fact
        
        lw      $v1,0($fp)
        mul     $v0,$v0,$v1 #n*fact(n-1)
return: #return処理
        lw      $ra,20($sp) #戻りアドレスを復元
        lw      $fp,16($sp) #フレームポインタを復元
        addiu   $sp,$sp,32  #スタックポインタをポップする
        j       $ra
