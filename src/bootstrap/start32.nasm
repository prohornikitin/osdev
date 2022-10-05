section .bss
	align 32
	stack_bottom:
		resb 16384
	stack_top:


bits 32
section .text
	extern checkCompatibility

	extern GDT.Code
	extern GDT.Pointer

	extern bootstrap_cmain
	extern bootstrap_loader64

	%include "first_page_tables_setup.nasmi"
	%include "enable_paging.nasmi"

		
	global start32
	start32:
		mov esp, stack_top ; Set up stack

		push ebx ; Preserve pointer to multiboot2 structure
		call checkCompatibility
		
		lgdt [GDT.Pointer]

		call bootstrap_cmain

		call setup_page_tables
		call enable_paging
		
		hlt
		call bootstrap_loader64 
		
