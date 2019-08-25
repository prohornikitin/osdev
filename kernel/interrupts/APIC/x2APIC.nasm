global x2APIC.setup

extern MSR.APIC
extern MSR.APIC_SIV

section .text
x2APIC:
	.setup:
		call .enable
		call .setupSIV
		call .startReceivingInterrupts
		mov rax, 2 ;means x2APIC mode
		ret

	.enable:
		mov ecx, [MSR.APIC]
		rdmsr
		or eax, (1 << 11) | (1 << 10) ; APIC enable and set x2ApicMode
		wrmsr
		ret
	
	.startReceivingInterrupts:
		mov Dword ecx, [MSR.APIC_SIV]
		rdmsr
		or eax, 1 << 8
		wrmsr
		ret

	.disableBroadcastingEOI:
		mov Dword ecx, [MSR.APIC_SIV]
		rdmsr
		or eax, 1 << 12
		wrmsr
		ret

	.setupSIV:
		mov Dword ecx, [MSR.APIC_SIV]
		rdmsr
		or eax, 32 ;set spurious interrupt vector as 32
		wrmsr
		ret