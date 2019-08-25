global xAPIC.setup


extern APIC_REGISTER_OFFSETS.SIV
extern MSR.APIC

xAPIC:
	.setup:
		call .relocateRegisters
		call .enable
		call .setupSIV
		call .disableBroadcastingEOI
		mov rax, 1 ;means xAPIC mode
		ret

	.enable:
		mov ecx, [MSR.APIC]
		rdmsr
		or eax, (1 << 11) ; enable
		wrmsr
		ret

	.relocateRegisters:
		mov ecx, [MSR.APIC]
		rdmsr
		mov rdi, xAPIC.registers
		and edi, 0xFFFFF000
		or eax, edi
		shr rdi, 32
		and rdi, 0xF
		or edi, edx
		wrmsr
		ret

	.setupSIV:
		mov rcx, .registers
		add rcx, APIC_REGISTER_OFFSETS.SIV
		mov rax, [rcx]
		or rax, 0x21 ;set spurious interrupt vector as 32
		ret

	.disableBroadcastingEOI:
		mov rcx, .registers
		add rcx, APIC_REGISTER_OFFSETS.SIV
		mov rax, [rcx]
		or rax, 1 << 12
		ret

align 0x1000
	.registers:
section .bss
		resb 4096
