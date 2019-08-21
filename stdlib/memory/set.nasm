global _ZN3mem3setEPvhm

_ZN3mem3setEPvhm: ;naming for c++ (mem::set(void* restrict mem, char value, size_t sizeInBytes))
	mov rcx, rdx
	shr rcx, 3
	cmp rcx, 0
	je .setByByte

	.makeQword:
		mov al, sil
		shl rax, 8
		mov al, sil
		mov si, ax
		shl rax, 16
		mov ax, si
		mov esi, eax
		shl rsi, 32
		mov esi, eax
	.setOneQword:
		mov qword [rdi], rsi
		add rdi, 8
		loop .setOneQword
	.setByByte:
		mov rcx, rdx
		and rcx, 0x7
		cmp rcx, 0
		je .end
		.setOneByte:
			mov byte [rdi], sil
			inc rdi
			loop .setOneByte
	.end:
		ret