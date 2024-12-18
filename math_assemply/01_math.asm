global main
section .text
main:
	mov rax,2
	add rax,4

	mov rax,3
	sub rax,2

	mov rax,3
	imul rax,rax,3

	mov rdx,0
	mov rax,1000
	mov rbx,20
	idiv rbx
_exit:
	mov rax,60
	mov rdi,11
	syscall
