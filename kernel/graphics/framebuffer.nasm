section .bss
    framebuffer_info:
        .address:
            resq 1
        .height:
            resd 1
        .width:
            resd 1

section .text
    global multiboot2_getFramebufferInfo
    extern multiboot2_findStructByType
    multiboot2_getFramebufferInfo:
        mov esi, 8
        call multiboot2_findStructByType
        cmp eax, 0
        je .error
        add eax, 8
        mov ebx, [eax]
        mov [framebuffer_info.address], ebx
        mov ebx, [eax+12]
        mov [framebuffer_info.width], ebx
        mov ebx, [eax+16]
        mov [framebuffer_info.height], ebx
        ret

        .error:
            int 0
            ret


align 0x1000
section .bss     
    page_tables_buff:
        resq 3000

section .text
    allocateFramebuffer:
        mov rdi, framebuffer_info.address
        call map_2MB
        mov rdi, 0x200000
        mov rsi, framebuffer_info.width
        mov rdx, framebuffer_info.height


    extern first_L2_table
    map_2MB: 
        mov rdx, rdi
        mov rdi, first_L2_table
        add rdi, 8

        mov rsi, page_tables_buff
        or rsi, 11b ; WRITABLE and PRESENT flags
        mov [rdi], rsi
        mov rdi, page_tables_buff

        or rdx, 11b  ; WRITABLE and PRESENT flags (2 first bits)
        mov rcx, 512

        .set_L1_table_entry:
            mov [rdi], rdx
            add rdx, 0x1000
            add rdi, 8
            loop .set_L1_table_entry
            ret
