
global ACPI_validateCheckSum

extern printErrorNumber

ACPI_validateCheckSum:; takes address of the first element of the header
		xor eax, eax
		mov ecx, 9
		.addDword:
			add ax, [edi]
			loop .addDword
		and eax, 0xFF
		cmp eax, 0
		jne .checkSumNotValid
		ret
	.checkSumNotValid:
		;TODO



		