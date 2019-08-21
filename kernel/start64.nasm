global start64

section .text

;%include "bootstrap.nasm"

bits 64

;extern LAPIC.startReceivingInterrupts
extern LAPIC.setX2Mode, LAPIC.disableBroadcastingEOI
extern kernelMain
extern setupIdt
extern identifyCpuTopology
extern printDecimal, printString
extern GDT.Data, GDT.TSS
extern CPUID.cpuVendor
extern setupTss

setupSegmentRegisters:
    mov ax, GDT.Data            ; Set the A-register to the data descriptor.
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    ret

hlt_loop:
    hlt
    jmp hlt_loop



start64:
	call setupSegmentRegisters
    call kernelMain
    call setupTss

    call setupIdt
    call LAPIC.setX2Mode
    ;call LAPIC.startReceivingInterrupts ; already done for us
    call LAPIC.disableBroadcastingEOI

   	call identifyCpuTopology
    

    ;invlpg
    ;tlbflush
    
    jmp hlt_loop

    
