.text
    .global _start

_start:
    mov    (%rsp), %r8 ## use r8  to store argc
.LOOP_START:
    cmp    $2, %r8 ## compare with 2, if smaller, skip loop
    jl     .LOOP_END ## end the loop if small than 2
    mov    $57, %rax ## system call number
    syscall          ## make the system call
    test   %rax, %rax
    jne    .IF_END ## if it is not 0, jump to the end of if
    mov    $57, %rax ## take the system call fork number
    syscall         ## make the system call, again
.IF_END:
    dec    %r8        ## minus 1 to the rcx(the argc)
    cmp    $1, %r8    ## compare r8 and 1
    jg    .LOOP_START  ## jump back and start the loop if greater
.LOOP_END:

    ## use different approach to end the program

    movl    $len,%edx       ##  third argument: message length.
    movl    $msg,%ecx       ## second argument: pointer to message to write.
    movl    $1,%ebx	        ## first argument: file handle (stdout).
    movl    $4,%eax	        ## system call number (sys_write).
    int     $0x80           ## call kernel.

    ## and exit.

    movl    $0,%ebx         ## first argument: exit code.
    movl    $1,%eax         ## system call number (sys_exit).
    int     $0x80           ## call kernel.

.data

msg:
        .ascii  "x\n"      # the string to print.
        len = . - msg                  # length of the string.
