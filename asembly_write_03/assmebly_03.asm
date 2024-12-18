global _start
section .text
_start:
	mov rax,1
	mov rdi,1
	mov rsi,dis
	mov rdx,dis_len
	syscall

user_input:
	mov rax,0
	mov rdi,0
	mov rsi,inpu
	mov rdx,100
	syscall
	mov rbx,rax
print_hello:
	mov rax,1
	mov rdi,1
	mov rsi,hel
	mov rdx,hel_len
	syscall

printing_username:
	mov rax,1
	mov rdi,1
	mov rsi,inpu
	mov rdx,rbx
	syscall
jmp exit_program
exit_program:
	mov rax,60
	mov rdi,11
	syscall

section .data
	dis: db 'Enter your name: '
	dis_len: equ $-dis
	hel:db 'Hello '
	hel_len: equ $-hel
	

section .bss
	inpu: resb 100
