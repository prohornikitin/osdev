extern printErrorNumber

checkApicSupport:
    mov eax, 1
    cpuid
    test ecx, 1 << 21
    jz .no_apic
    ret
    .no_apic:
        mov al, "3"
        jmp printErrorNumber

