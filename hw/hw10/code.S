    .globol main
    .text
main:
    xor     %rax, %rax
    mov     %rax, %rbx
.L1:
    add     $1, %rbx
    add     %rbx, %rax
    cmp     $10, %rbx
    jne     .L1
    ret
