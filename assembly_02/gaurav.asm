global _start

section .text
	_start:
		mov rax,1
		mov rdi,1
		mov rsi,g
		mov rdx,16
	syscall
	

		mov rax,60
		mov rdi,11
	syscall

section .data
	g: db 'Hello gaurav boy'
