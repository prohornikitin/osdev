extern printErrorNumber
extern CPUID.maxExtendedValue


checkLongmodeSupport:
    mov eax, 0x80000000    
    cpuid                  
    cmp eax, 0x80000001    ; it needs to be at least 0x80000001
    jl .no_longmode       ; if it's less, the CPU is too old for long mode

    ; use extended info to test if long mode is available
    mov eax, 0x80000001    ; extended processor info
    cpuid                  
    test edx, 1 << 29      ; test if the LM-bit is set in the D-register
    jz .no_longmode       ; If it's not set, there is no long mode
    ret
    .no_longmode:
        mov al, "2"
        jmp printErrorNumber

