global printString
global printDecimal

currentSymbolPointer:
	dq 0xB8000

printString:
	mov ecx, [currentSymbolPointer]
	mov rax, 7 << 8
	.printChar:
		mov byte al, [rdi]
		mov word [rcx], ax
		inc rdi
		add rcx, 2
		cmp al, 0
		jne .printChar
	mov [currentSymbolPointer], rcx
	ret

printDecimal:
	push rbp
	mov rbp, rsp
	mov rax, rdi
	mov rdi, 10
	.pushDigit:
		xor rdx, rdx
		div rdi
		add dl, '0'
		or dx, 7 << 8 ;black barground, white text
		push dx
		cmp rax, 0
		jne .pushDigit
	mov rdi, [currentSymbolPointer]
	.printDigit:
		pop dx
		mov word [rdi], dx
		add rdi, 2
		cmp rbp, rsp
		jne .printDigit
	mov [currentSymbolPointer], rdi
	pop rbp
	ret


