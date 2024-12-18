%include "../util.asm"

global _start 

section .text
    _start:

        mov rdi,message
        call printstr
        call readint
        mov [user_value],rax
        mov rbx,1
    multi:
        mov rcx,[user_value]
        imul rcx,rbx
        mov rdi,rcx
        call printint
        call endl
        add rbx,1
        cmp rbx,11
        jne multi
        call exit0



section .data
    message: db "Enter Number : ",0
section .bss 
    user_value: resb 8