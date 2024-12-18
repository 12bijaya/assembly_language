global _start

section .text

    _start:

        ask_for_name:

            mov rax,1
            mov rdi,1
            mov rsi,var_1
            mov rdx,var_1_len
            syscall
            
        input_name:

            mov rax,0
            mov rdi,0
            mov rsi,vari_1
            mov rdx,100
            syscall    
            mov rbx,rax

        ask_for_age:

            mov rax,1
            mov rdi,1
            mov rsi,var_2
            mov rdx,var_2_len
            syscall

        input_age:

            mov rax,0
            mov rdi,0
            mov rsi,vari_2
            mov rdx,100
            syscall    
            mov rcx,rax
        
        display_the_front:


            mov rax,1
            mov rdi,1
            mov rsi,var_3
            mov rdx,var_3_len
            syscall
        display_the_name:


            mov rax,1
            mov rdi,1
            mov rsi,vari_1
            mov rdx,rbx
            syscall

        display_the_front_2:


            mov rax,1
            mov rdi,1
            mov rsi,var_4
            mov rdx,var_4_len
            syscall

        display_the_age:

            mov rax,1
            mov rdi,1
            mov rsi,vari_2
            mov rcx,rbx
            syscall
        exit_the_program:
            mov rax,60
            mov rdi,11
            syscall

section .data
    var_1: db "Enter your name: "
    var_1_len: equ $-var_1
    var_2:db "Enter your age: "
    var_2_len:equ $-var_2
    var_3:db "Hi "
    var_3_len: equ $-var_3
    var_4:db "with age "
    var_4_len: equ                                                 $-var_4



section .bss
    vari_1: resb 100
    vari_2: resb 100