bits 32

global multiboot2_findStructByType

multiboot2_findStructByType: ;multiboot2 struct should be in ebx
	mov dword ecx, [ebx]
	mov dword edx, ebx
	.tryToFind:
		add ebx, 4
		sub ecx, 4
		mov dword eax, [ebx]
		cmp ecx, 0
		je .end
		cmp eax, edi
		jne .tryToFind
	mov eax, 0
	.end:
		mov ebx, edx
		ret