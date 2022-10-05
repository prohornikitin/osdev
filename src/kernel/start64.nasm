global start64

section .text


bits 64

extern APIC.setup
extern kernelMain
extern test
extern identifyCpuTopology
extern printDecimal, printString
extern CPUID.cpuVendor
extern setupTss
extern findTablePointer
extern picDisable
extern fillIdt


setupSegmentRegisters:
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    ret

hlt_loop:
    hlt
    jmp hlt_loop


;TODO: GDT.Data in ax register
start64:
    call setupSegmentRegisters
    ;call setupTss

    call picDisable
    call fillIdt
    call kernelMain

    jmp hlt_loop

    .err:
        int 0
        ret
