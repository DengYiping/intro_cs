    .global main ;make the symbol global so that other can access this main function
    .text ; tell the assembler it is text segment(instruction) 
main:
    xor     %rax, %rax ; clear the rax register 
    mov     %rax, %rbx ; copy the value of rax register into rbx register 
.L1:
    add     $1, %rbx ; add 1 to rbx 
    add     %rbx, %rax ; add value of rbx to rax 
    cmp     $10, %rbx ; set condition flag by minus rbx - 10 
    jne     .L1 ; jump to line L1 if rbx is not 10 
    ret ; return the value in rax 
