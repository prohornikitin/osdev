



section .bss
    align 16
	stack_bottom:
	    resb 16384
	stack_top:


bits 32
section .text
    
    extern runAllChecks

    extern checkCpuidSupport


    extern GDT.Code
    extern GDT.Pointer


;    %include "GDT.nasm"
    %include "paging/first_tables_setup.nasm"
    %include "paging/enable.nasm"

    	extern start64
    	
    	global start32
    	start32:
        	mov esp, stack_top ; Set up stack


            call checkCpuidSupport

        	call runAllChecks


    		call setup_page_tables
    		call enable_paging
    		
        	lgdt [GDT.Pointer]
        	jmp GDT.Code:start64       ; Set the code segment and enter 64-bit long mode.
