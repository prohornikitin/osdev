global _ZN3mem4copyEPvS0_m

_ZN3mem4copyEPvS0_m: ;Naming for c++ (mem::copy(void* destination, void* source, size_t bytesNum))
	push rcx
	.copyByQword:
		mov rcx, rdx
		shr rcx, 3
		rep movsq

	.copyByByte:
		mov rcx, rdx
		and rcx, 0x7
		rep movsb
	pop rcx
	cld
	ret
	