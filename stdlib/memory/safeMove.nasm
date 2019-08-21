global _ZN3mem8safeMoveEPvS0_m
extern _ZN3mem4copyEPvS0_m
extern printDecimal

_ZN3mem8safeMoveEPvS0_m: ;Naming for c++ (mem::overlapSafeMove(void* destination, void* source, size_t bytesNum))
	cmp rdi, rsi
	jl _ZN3mem4copyEPvS0_m ;Naming for c++ (mem::copy(void* destination, void* source, size_t bytesNum))
	std
	dec rdx
	add rdi, rdx
	add rsi, rdx
	inc rdx
	jmp _ZN3mem4copyEPvS0_m ;Naming for c++ (mem::copy(void* destination, void* source, size_t bytesNum))