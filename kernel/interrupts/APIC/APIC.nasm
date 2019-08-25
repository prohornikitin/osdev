
extern MSR.APIC
extern MSR.APIC_SIV
global APIC.setup


extern xAPIC.setup
extern x2APIC.setup

APIC:
	.setup:
		mov eax, 1
		cpuid
		test ecx, 1<<21 ;x2APIC support
		jz xAPIC.setup
		jmp x2APIC.setup







