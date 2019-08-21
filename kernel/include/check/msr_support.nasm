extern printErrorNumber

checkMsrSupport:
	mov eax, 00000001h
	cpuid
	test ecx, 1 << 5
	jz .no_msr
	ret
	.no_msr:
	    mov al, "4"
	    jmp printErrorNumber