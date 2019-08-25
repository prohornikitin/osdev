global getValidXSDT

extern multiboot2_findStructByType
extern ACPI_validateCheckSum

bits 32

getValidXSDT:
	mov esi, 15
	call multiboot2_findStructByType
	
	add eax, 8
	mov edx, eax

	mov edi, eax
	call ACPI_validateCheckSum

	add edx, 24
	mov eax, [edx]
	add edx, 4
	mov edx, [edx]
	ret