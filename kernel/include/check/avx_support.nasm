extern printErrorNumber

checkAvxSupport:
	mov eax, 1
	cpuid
	test ecx, 1 << 28
	jz .no_avx
	ret
	.no_avx:
	    mov al, "5"
	    jmp printErrorNumber