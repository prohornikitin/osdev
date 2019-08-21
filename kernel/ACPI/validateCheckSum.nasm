
global validateCheckSum

extern printErrorNumber

validateCheckSum:; takes address of the first element of the RSDP
	.validateCheckSumForV1:
		xor eax, eax
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		and eax, 0xFF
		cmp eax, 0
		jne .checkSumNotValid
	.validateCheckSumForV2:
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		add edi, 4
		add eax, [edi]
		and eax, 0xFF
		cmp eax, 0
		jne .checkSumNotValid
		ret
	.checkSumNotValid:
		mov al, "6"
		jmp printErrorNumber



		