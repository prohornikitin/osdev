
extern printString
extern ACPI.XSDT

section .data
error:
	db "Can\'t Find ACPI Table ", 0

section .text

global findTablePointer

findTablePointer:
	xor rcx, rcx
	mov ecx, [ACPI.XSDT+4]
	sub ecx, 36

	xor rax, rax
	mov eax, [ACPI.XSDT+36+4]

	.validateTable:
		add rax, 36
		sub rcx, 36
		cmp edi, [rax]
		je .found
		loop .validateTable
		mov rdi, error
		call printString
		hlt

	.found:
		ret

