global getValidRSDP

extern multiboot2_findStructByType
extern validateCheckSum

bits 32

getValidRSDP:
	mov edi, 15
	call multiboot2_findStructByType
	
	add eax, 8
	mov edx, [eax]

	mov edi, [eax]
	call validateCheckSum

	add edx, 192
	mov Dword eax, [edx]
	add edx, 4
	mov Dword edx, [edx]
	ret