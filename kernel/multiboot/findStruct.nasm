bits 32

global multiboot2_findStructByType
extern printErrorNumber
multiboot2_findStructByType: ;multiboot2 struct pointer should be in EDI, type in ESI
	mov dword ecx, [edi]
	add ecx, edi
	add edi, 8
	.tryToFind:
		cmp [edi], esi
		je .found

		add edi, 4	; edi points to size of the tag
		add edi, [edi] 	; add size (next tag)

		add edi, 11b
		and edi, 0xFFFFFFF8 ;8-byte alignment

		cmp ecx, edi
		jg .tryToFind
	mov eax, 0
	ret
	.found:
		mov eax, edi
		ret