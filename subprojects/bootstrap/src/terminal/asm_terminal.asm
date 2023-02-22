bits 32

section .data

currentSymbolPointer:
	dd 0xB8000 ;black barground, white text


section .text

global printString
global printDecimal

printString:
	mov edi, [esp+4]
	mov ecx, [currentSymbolPointer]
	mov eax, 7 << 8
	.printChar:
		mov byte al, [edi]
		mov word [ecx], ax
		inc edi
		add ecx, 2
		cmp al, 0
		jne .printChar
	mov [currentSymbolPointer], ecx
	ret


printDecimal:
	push ebp
	mov eax, [esp+8]
	push edx
	push edi
	mov ebp, esp
	mov edi, 10
	.pushDigit:
		xor edx, edx
		div edi
		push dx
		cmp eax, 0
		jne .pushDigit
	mov edi, [currentSymbolPointer]
	.printDigit:
		pop dx
		add dl, '0'
		or dx, 7 << 8 ;black barground, white text
		mov word [edi], dx
		add edi, 2
		cmp ebp, esp
		jne .printDigit
	mov [currentSymbolPointer], edi
	pop edi
	pop edx
	pop ebp
	ret


