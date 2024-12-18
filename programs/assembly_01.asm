global _start
section .text
    _start:
        asking_for_name:
            mov rax, 1
            mov rdi, 1
            mov rsi, name
            mov rsi, name_len
            syscall

        reading_the_name:
            mov rax, 0
            mov rdi, 0
            mov rsi, _name 
            mov rdx,  100
            syscall
            mov rcx,rax

        asking_for_age:
            mov rax, 1
            mov rdi, 1
            mov rsi, age 
            mov rsi, age_len
            syscall

        reading_the_age:
            mov rax, 0
            mov rdi, 0
            mov rsi, _age 
            mov rdx, 100
            syscall
            mov rbx, rax

        printing_name_:
            mov rax, 1
            mov rdi, 1
            mov rsi, _name
            mov rsi, rcx
            syscall
        
        printing_age:
            mov rax, 1
            mov rdi, 1
            mov rsi, _age
            mov rdx, rbx
            syscall

        exit:
        mov rax, 60
        mov rdi, 11
        syscall


section .data
    name: db "Enter your name "
    name_len: equ $-name
    age: db "Enter your age "
    age_len: equ $-age
section .bss
    _name: resb 100
    _age: resb 100