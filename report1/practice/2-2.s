        .data
        .align 2
msg:
        .byte   72,101,108,108,111,2
        
        .text
        .align 2
main:
        la      $a0,msg
