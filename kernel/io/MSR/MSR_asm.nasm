section .rodata

global MSR.APIC
global MSR.APIC_SIV
global MSR.LAPIC_version
global MSR.LAPIC_ICR

global writeMSR
global readMSR

writeMSR:
	mov ecx, edi
	mov rdx, rsi
	mov eax, edx
	shr rdx, 32
	wrmsr
	ret

readMSR:
	mov ecx, edi
	rdmsr
	shl rdx, 32
	mov edx, eax
	mov rax, rdx
	ret

MSR:
	.APIC:
		dd 0x1B
	.APIC_base:
		dd 0x800
	.APIC_SIV: ;spurious interrupt vector register
		dd 0x800 + 0xF
	.LAPIC_ID:
		dd 0x800 + 0x2
	.LAPIC_version:
		dd 0x800 + 0x3
	.LAPIC_ICR:
		dd 0x800 + 0x30
	.LAPIC_LVT_timer:
		dd 0x800 + 0x32
	.LAPIC_LVT_thermal_monitor:
		dd 0x800 + 0x33
	.LAPIC_LVT_Performance_counter:
		dd 0x800 + 0x34
	.LAPIC_LVT_LINT0:
		dd 0x800 + 0x35
	.LAPIC_LVT_LINT1:
		dd 0x800 + 0x36
	.LAPIC_LVT_Error:
		dd 0x800 + 0x37
