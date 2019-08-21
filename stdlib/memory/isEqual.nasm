global _ZN3mem7isEqualEPKvS1_m; naming for c++ bool isEqual(const void* restrict mem0, const void* restrict mem1, size_t n);

_ZN3mem7isEqualEPKvS1_m:; naming for c++ bool isEqual(const void* restrict mem0, const void* restrict mem1, size_t n);
	mov rcx, rdx
	repe cmpsb
	je .equal
	xor rax, rax
	ret
	.equal:
		mov rax, 1
		ret