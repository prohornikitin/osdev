global _ZN3mem12copyBackwardEPvS0_m

_ZN3mem12copyBackwardEPvS0_m: ;Naming for c++ (mem::copyBackward(void* destination, void* source, size_t bytesNum))
	std
	dec rdx
	add rdi, rdx
	add rsi, rdx
	inc rdx
	.copyByQword:
		mov rcx, rdx
		shr rcx, 3
		rep movsq

	.copyByByte:
		mov rcx, rdx
		and rcx, 0x7
		rep movsb
	cld
	ret