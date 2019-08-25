section .rodata

global MSR.APIC
global MSR.APIC_SIV
global MSR.LAPIC_version
global MSR.LAPIC_ICR

global writeMSR
global readMSR

MSR:
	.APIC:
		dd 0x1B
	.APIC_BASE:
		dd 0x800
	.APIC_SIV: ;spurious interrupt vector register
		dd 0x800 + 0xF
	.LAPIC_ID:
		dd 0x800 + 0x2