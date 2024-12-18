global _start

section .text

	_start:
		jmp started

		started:
			mov rax,1
			mov rdi,1
			mov rsi,key
			mov rdx,key_len
			syscall

		main:
			mov rax,0
			mov rdi,0
			mov rsi,input_key
			mov rdx,1000
			syscall
 			jmp compare
		compare:
			mov rsi,orginal_key
			mov rdi,input_key
			repe cmpsb
			je access_granted
			jne access_denied
 
		access_granted:
			mov rax,1
			mov rdi,1
			mov rsi,access
			mov rdx,access_len
			syscall
			jmp exit

		access_denied:
			mov rax,1
			mov rdi,1
			mov rsi,unaccess
			mov rdx,unaccess_len
			syscall
			jmp exit

		exit:
			mov rax,60
			mov rdi,11
			syscall

section .data
	key: db "Enter the key: "
	key_len: equ $-key
	access: db "Access Granted!",10
	access_len: equ $-access
	unaccess: db "Access Denied!",10
	unaccess_len: equ $-unaccess
	orginal_key: db "1234-5678-9101-1121"
	orginal_key_len: equ $-orginal_key
section .bss
	input_key: resb 1000
 
