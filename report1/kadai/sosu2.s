array:
        .space 400
        
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
        subu    $sp,$sp,32 #stackpointer
        sw      $ra,20($sp) #$ra
        sw      $fp,16($sp) #flamepointer
        addiu   $fp,$sp,28  #set fp

        li      $t0,2   # 1 is not prime
prime_for:
        beq     $t0, $a0, return1   # return1 if n is prime number (i==n)
        bgt     $t0, $a0, prime_exit    # break the for if n > i
        rem     $t1, $a0, $t0       # $t1 = n % i
        beqz    $t1, prime_exit     # goto Exit_prime if $t1 == 0
        addi    $t0, $t0, 1         # increment i
        j       prime_for           # loop again with incremented i
return1:
        li      $v0,1       #if number is prime
        lw      $ra,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,32
        j       $ra
prime_exit:
        li      $v0,0       #if number is not prime
        lw      $ra,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,32
        j       $ra


main:
        subu    $sp,$sp,32 #stackpointer
        sw      $ra,20($sp) #$ra
        sw      $fp,16($sp) #flamepointer
        addiu   $fp,$sp,28  #set fp

        li    $v0, 4          # for syscall of print_string
        la    $a0, start       # Start
        syscall               # print info

        li      $s0,100     #number of max(match<100)
        li      $s1,0       #number of loop(match)
        li      $s2,2       #number to check and print(n=2)
        li      $s3,1       #test_prime(n) == $s3
        la      $a1,array

while:  
        beq     $s0,$s1,exit # s1 == 100 => exit
        move    $a0,$s2     # $s2 => $a0
        jal     test_prime
        
        bne     $v0,$s3,else    # $v0 != 1

        li      $t4, 4          # For array increasing
        addu    $a1, $a1, $t4   # $a1 = $a1 + 4
        sw      $s2, 0($a1)     # Put prime number into array
        
        addiu   $s1,$s1,1   #n++
        
else:   
        addiu   $s2, $s2, 1     # n = n + 1 
        j       while            # go to Loop
exit:   
        li      $v0, 4          # for syscall of print_string
        la      $a0, mark       # Mark of ">"
        syscall                 # print mark
        la      $a1, array      # Initialize $a1
        li      $v0, 5          # For syscall of read_int
        syscall                 # read_int for number of prime
        beqz    $v0,end
        bltz    $v0,error
        bgtu    $v0,$s0,error
        
        move    $t3, $v0        # Put argument into $t3
        addu    $t3, $t3, $t3   # $t3 = $t3 * 2
        addu    $t3, $t3, $t3   # $t3 = $t3 * 2
        addu    $a1, $a1, $t3   # Add address to fetch
        
        lw      $a0, 0($a1)     # Fetch selected prime
        li      $v0, 1          # For syscall of print_int
        syscall                 # Print prime
        
        j       exit
        

error:
        li    $v0, 4          # for syscall of print_string
        la    $a0, excep      # Print error message
        syscall               # print info
        j     exit

  
end:
        li      $v0, 4        # for syscall of print_string
        la      $a0, owari    
        syscall               # print
        
        lw      $ra, 20($sp)  # Restore return address
        lw      $fp, 16($sp)  # Restore frame pointer
        addiu   $sp, $sp, 32  # Pop stack frame
        
        j       $ra         # End this program
