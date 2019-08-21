global detectCpuVendor
extern CPUID.cpuVendor
bits 32



detectCpuVendor:; 'cAMD' if AMD and 'ntel' if intel
	mov eax, 0
	cpuid
	mov ecx, ebx
	ret


