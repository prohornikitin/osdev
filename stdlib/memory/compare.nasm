global _ZN3mem7compareEPKvS1_m

_ZN3mem7compareEPKvS1_m:
	mov rcx, rdx
	repe cmpsb
	je .equal
	sub rdi, rsi
	mov rax, rdi
	ret
	.equal:
		xor rax, rax
		ret