        .text
        .align 2
        .globl main
main:
        subu  $sp, $sp, 32   # Length of stack frame: 32 bytes
        sw    $ra, 20($sp)  # Save return address (戻りアドレスを退避)
        sw    $fp, 16($sp)  # Save old frame pointer (古いフレームポインタを退避)
        addiu $fp, $sp, 28  # Set up frame pointer

        li    $a0, 10       # Put argument (10) in $a0
        jal   fact          # Call factorial function

        la    $a0, str      # Put format string in $a0
        move  $a1, $v0      # Move fact result to $a1
        jal   printf        # Call the print function

        lw    $ra, 20($sp)  # Restore return address
        lw    $fp, 16($sp)  # Restore frame pointer
        addiu $sp, $sp, 32  # Pop stack frame
        jr    $ra           # Return to caller

        .data
        .align 2
str:
        .asciiz  "The factorial of 10 is "

        .text
        .align 2
fact:
        subu    $sp, $sp, 32 # Stack frame is 32 bytes long
        sw      $ra, 20($sp) # Save return address
        sw      $fp, 16($sp) # Save frame pointer
        addiu   $fp, $sp, 28 # Set up frame pointer
        sw      $a0, 0($fp)  # Save argument (n)

        lw      $v0, 0($fp)  # Load n
        bgtz    $v0, $L2     # Branch if n > 0
        li      $v0, 1       # Return 1
        jr      $L1          # Jump to code to return

$L2:
        lw      $v1, 0($fp)   # Load n
        subu    $v0, $v1, 1   # Compute n - 1
        move    $a0, $v0      # Move value to $a0
        jal     fact          # Call factorial function

        lw      $v1, 0($fp)   # Load n
        mul     $v0, $v0, $v1 # Compute fact(n-1) * n

$L1:                  # Result is in $v0
        lw      $ra, 20($sp)  # Restore $ra
        lw      $fp, 16($sp)  # Restore $fp
        addiu   $sp, $sp, 32  # Pop stack
        jr      $ra

        .text
        .align 2
printf:
        subu    $sp, $sp, 32 # Stack frame is 32 bytes long
        sw      $ra, 20($sp) # Save return address
        sw      $fp, 16($sp) # Save frame pointer
        addiu   $fp, $sp, 28 # Set up frame pointer
  
        li      $v0, 4        # syscall of print_string
        syscall               # Print format string
        li      $v0, 1        # syscal of print_int
        move    $a0, $a1      # Move $a1 to $a0 for syscall
        syscall               # Print n

        lw      $ra, 20($sp)  # Restore $ra
        lw      $fp, 16($sp)  # Restore $fp
        addiu   $sp, $sp, 32  # Pop stack
        jr      $ra
