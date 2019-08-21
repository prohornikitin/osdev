extern printErrorNumber

bits 32

global checkCpuidSupport

checkCpuidSupport:
    ; Copy FLAGS in to EAX via stack
    pushfd
    pop eax
    mov edx, eax

    ; Flip the ID bit
    xor eax, 1 << 21

    ; Copy EAX to FLAGS via the stack
    push eax
    popfd

    ;Copy FLAGS back to EAX (with the flipped bit if CPUID is supported)
    pushfd
    pop eax

    ; Restore FLAGS from the old version stored in ECX
    push edx
    popfd

    ; If eax is equal ecx then that means the bit
    ; wasn't flipped, and CPUID isn't supported.
    cmp eax, edx
    je .no_cpuid
    ret
	.no_cpuid:
	    mov al, "1"
	    jmp printErrorNumber