bits 32
section .rodata
	error db "Not compatible", 0



global checkCompatibility
extern printString

%define CPUID_ARG_HIGHEST_ARG 0x80000000

%define CPUID_ARG_EXTENDED_PROCESSOR_FEATURES 0x80000001
%define FEATURE_EDX_MSR      1 << 5
%define FEATURE_EDX_APIC     1 << 9
%define FEATURE_EDX_LONGMODE 1 << 29
%define FEATURES_EDX FEATURE_EDX_MSR | FEATURE_EDX_APIC | FEATURE_EDX_LONGMODE

section .text
checkCompatibility:
	mov eax, CPUID_ARG_HIGHEST_ARG
	cpuid                  
	cmp eax, 0x80000001   ; it needs to be at least 0x80000001
	jl .notCompatible     ; if it's less than CPU is too old and long mode unspoorted

	mov eax, CPUID_ARG_EXTENDED_PROCESSOR_FEATURES
	test eax, FEATURES_EDX
	jnz .notCompatible
	ret


	.notCompatible:
		mov eax, error
		push eax
		call printString
		pop eax
		hlt
		ret
