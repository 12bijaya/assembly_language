%include"../util.asm"

global _start

section .text

_start:
    mov rdi,num1
    call printstr
    call readint
    mov [user_num1],rax
    mov rdi,num2
    call printstr
    call readint
    mov [user_num2],rax
    mov rdi,operators
    call printstr
    mov rdi,user_operator
    mov rsi,2
    call readstr

compare_operation:
    mov rdi,[user_operator]
    cmp rdi,43
    je addition
    cmp rdi,45
    je subtraction
    cmp rdi,42
    je multiply
    cmp rdi,47
    je division
    cmp rdi,37
    je remainder

erroer:
    mov rdi,error_mssg
    call printstr
    call endl
    call exit0

addition:
    mov rdi,[user_num1]
    add rdi,[user_num2]
    call results

subtraction:
    mov rdi,[user_num1]
    sub rdi,[user_num2]
    call results

multiply:
    mov rdi,[user_num1]
    mov rbx,[user_num2]
    imul rdi,rbx
    call results

division:
    mov rdx,0
    mov rax,[user_num1]
    mov rbx,[user_num2]
    idiv rbx
    mov rdi,rax
    call results

remainder:
    mov rdx,0
    mov rax,[user_num1]
    mov rbx,[user_num2]
    idiv rbx
    mov rdi,rdx
    call results

results:
    call printint
    call endl
    call exit0
section .data

    num1: db "Enter first number : ",0
    num2: db "Enter second number : ",0
    operators: db "Enter the operators(+,-,*,%,/): ",0
    error_mssg: db "Cannnot perform the operation!"

section .bss

    user_num1: resb 8
    user_num2: resb 8
    user_operator: resb 2