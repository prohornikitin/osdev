bits 32

global cpuManufacturerId
global checkCompatibility


section .bss
	cpuManufacturerId:
		resd 3

section .text
;	mov eax, 0
;	cpuid
;	mov [cpuManufacturerId], ebx
;	mov [cpuManufacturerId+4], edx
;	mov [cpuManufacturerId+8], ecx

checkCompatibility:
	push ebx
	mov eax, 7
	xor ecx, ecx
	cpuid
	test ebx, 1<<5  ; check AVX2 support
	jz .notCompatible

	.checkExtendedCpuidAvailibility:
		mov eax, 0x80000000    
	    cpuid                  
	    cmp eax, 0x80000001   ; it needs to be at least 0x80000001
	    jl .notCompatible     ; if it's less, the CPU is too old

	mov eax, 0x80000001
	;1<<5   MSR support
	;1<<9   APIC support
	;1<<11  SYSCALL/SYSRET instructions availibility
	;1<<29  Long Mode support
	%define processorFeaturesFlags (1<<5) | (1<<9) | (1<<11) | (1<<29)
	and edx, processorFeaturesFlags
	cmp edx, processorFeaturesFlags
	jne .notCompatible
	
	pop ebx
	ret


	.notCompatible:
		int 0
		ret
	
	
