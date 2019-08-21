extern CPUID.maxValue
extern CPUID.maxExtendedValue

global detectMaxCpuidValue

detectMaxCpuidValue:
	.detectMaxUsualCpuidValue:
		xor eax, eax
		cpuid
		mov eax, [CPUID.maxValue]
	.detectMaxExtendedCpuidValue:
		mov eax, 0x80000000
		cpuid 
		mov eax, [CPUID.maxExtendedValue]
	ret
