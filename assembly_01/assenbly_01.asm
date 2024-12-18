global _start

section .text

_start:
	; print hello world(This semicolon is for comment)
	mov rax,1	 ;write syscall
	mov rdi,1	 ;file descriptor 'fd' -> (output)
	mov rsi,hello 	 ;buff ->hello -> 'hello world'
	mov rdx,11	 ;count -> 11(size)
	syscall
	

	;exit
	mov rax,60	 ;exit syscall
	mov rdi,22 	 ;status code ->22
	syscall

section .data
	hello: db 'hello world'
