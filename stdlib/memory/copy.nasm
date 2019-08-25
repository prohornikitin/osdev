global _ZN3mem4copyEPvS0_m

_ZN3mem4copyEPvS0_m: ;Naming for c++ (mem::copy(void* destination, void* source, size_t bytesNum))
; all the memory aligned by 8 bytes, so...
		mov rcx, rdx
		add rcx, 7
		shr rcx, 3
		rep movsq
	