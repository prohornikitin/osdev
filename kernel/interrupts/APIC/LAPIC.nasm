;MSR_apic equ 0x1B
;extern MSR.read64
extern MSR.APIC
extern MSR.APIC_SIV
global LAPIC.setX2Mode
global LAPIC.startReceivingInterrupts
global LAPIC.disableBroadcastingEOI

LAPIC:
	.setX2Mode:
		mov ecx, [MSR.APIC]
		rdmsr

		or eax, 1 << 10 ; x2APIC mode
		or eax, 1 << 11 ; APIC enable
		
		wrmsr
		ret

	.start_receiving_interrupts:
		mov Dword ecx, [MSR.APIC_SIV]
		rdmsr
		or eax, 1 << 8
		wrmsr
		ret

	.disableBroadcastingEOI:
		mov Dword ecx, [MSR.APIC_SIV]
		rdmsr
		or eax, 1 << 12; broadcasting EOI disable
		wrmsr
		ret



	

