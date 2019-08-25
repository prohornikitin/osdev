global start64

section .text


bits 64

extern APIC.setup
extern kernelMain
extern test
extern setupIdt
extern identifyCpuTopology
extern printDecimal, printString
extern GDT.Data, GDT.TSS
extern CPUID.cpuVendor
extern setupTss
extern findTablePointer


setupSegmentRegisters:
    mov ax, GDT.Data
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
    call setupTss

    call kernelMain

    call setupIdt
    call APIC.setup

    

    jmp hlt_loop

    .err:
        int 0
        ret