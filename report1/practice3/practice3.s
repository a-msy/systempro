        .text
        .align 2

main:   li  $v0,4
        la  $a0,msg
        syscall
        j   $ra
        
        .data
        .align 2
msg:    .asciiz "Hello,World"     #msg
