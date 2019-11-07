        .data
        .align 2
str:    .asciiz "Hello World"

        .text
        .align 2

main:   li  $v0,4   #print_strのシスコールを$v0にロード
        la  $a0,str #プリントする文字列のアドレスをsyscallの引数
                    #$a0にロードアドレス命令を行う
        syscall
        j   $ra     #$raレジスタへ戻り、プログラム終了
