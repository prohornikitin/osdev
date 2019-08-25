

section .bss
	ALIGN 32
	IDT:
		resb 256*16

section .text
		.Pointer:
			dw (256*16)-1
			dq IDT



	global setupIdt
	extern GDT.Code

	%macro FILL_IDT_ENTRY 2 ; first argument is number, second is type and parameters
	    extern handleInterrupt%1
	    mov rax, handleInterrupt%1
	    mov [IDT+%1*16], ax
	    mov word [IDT+%1*16+2], GDT.Code
	    mov word [IDT+%1*16+4], %2
	    shr rax, 16
	    mov [IDT+%1*16+6], ax
	    shr rax, 16
	    mov [IDT+%1*16+8], eax
	%endmacro


	setupIdt:
		lidt [IDT.Pointer]
		.fillIdt:
		    FILL_IDT_ENTRY 0, 0xEF00
		    FILL_IDT_ENTRY 4, 0xEF00
		    FILL_IDT_ENTRY 5, 0xEF00
		    FILL_IDT_ENTRY 6, 0xEF00
		    FILL_IDT_ENTRY 7, 0xEF00
		    FILL_IDT_ENTRY 8, 0xEF00
		    FILL_IDT_ENTRY 9, 0xEF00
		    FILL_IDT_ENTRY 10, 0xEF00
		    FILL_IDT_ENTRY 11, 0xEF00
		    FILL_IDT_ENTRY 12, 0xEF00
		    FILL_IDT_ENTRY 13, 0xEF00
		    FILL_IDT_ENTRY 14, 0xEF00
		    FILL_IDT_ENTRY 16, 0xEF00
		    FILL_IDT_ENTRY 17, 0xEF00
		    FILL_IDT_ENTRY 18, 0xEF00
		    FILL_IDT_ENTRY 19, 0xEF00
		    FILL_IDT_ENTRY 20, 0xEF00
		    FILL_IDT_ENTRY 32, 0xEF00
		    ret