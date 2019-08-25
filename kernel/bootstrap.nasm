section .bss
    align 32
	stack_bottom:
	    resb 16384
	stack_top:


bits 32
section .text
    extern checkCpuidSupport
    extern checkCompatibility
    
    extern getValidXSDT
    extern ACPI.XSDT
    extern allocateAcpiMemRegion

    extern GDT.Code
    extern GDT.Pointer

    extern multiboot2_getFramebufferInfo

    extern start64

    %include "paging/first_tables_setup.nasm"
    %include "paging/enable.nasm"



    	
	global start32
	start32:
    	mov esp, stack_top ; Set up stack
        call checkCompatibility

        mov edi, ebx
        call multiboot2_getFramebufferInfo

        lgdt [GDT.Pointer]
        
        call setup_page_tables
        call enable_paging

    	jmp GDT.Code : start64       ; Set the code segment and enter 64-bit long mode.
