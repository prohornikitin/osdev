

section .bss
	IDT:
		resb 256*16

section .text
		.Pointer:
			dw (256*16)-1
			dq IDT



	global setupIdt
	extern GDT.Code

	%macro FILL_IDT_ENTRY 2 ; second argument is parameters and gate type
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

	;%macro FILL_IDT_TASK_SWITCH_ENTRY 2 ; second argument is parameters and gate type
	;	extern GDT.TSS
	;    mov word [IDT+%1*16+2], GDT.TSS
	;    mov word [IDT+%1*16+3], 0 ;kernel IST
	;    mov word [IDT+%1*16+4], %2
	;%endmacro


	setupIdt:
		lidt [IDT.Pointer]
		.fillIdt:
		    FILL_IDT_ENTRY 0, 0xEE00
		    FILL_IDT_ENTRY 4, 0xEE00
		    FILL_IDT_ENTRY 5, 0xEE00
		    FILL_IDT_ENTRY 6, 0xEE00
		    FILL_IDT_ENTRY 7, 0xEE00
		    FILL_IDT_ENTRY 8, 0xEE00
		    FILL_IDT_ENTRY 9, 0xEE00
		    FILL_IDT_ENTRY 10, 0xEE00
		    FILL_IDT_ENTRY 11, 0xEE00
		    FILL_IDT_ENTRY 12, 0xEE00
		    FILL_IDT_ENTRY 13, 0xEE00
		    FILL_IDT_ENTRY 14, 0xEE00
		    FILL_IDT_ENTRY 16, 0xEE00
		    FILL_IDT_ENTRY 17, 0xEE00
		    FILL_IDT_ENTRY 18, 0xEE00
		    FILL_IDT_ENTRY 19, 0xEE00
		    FILL_IDT_ENTRY 20, 0xEE00
		    ret