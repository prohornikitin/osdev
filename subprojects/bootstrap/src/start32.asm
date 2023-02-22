bits 32
section .bss
	align 32
	stack_bottom:
		resb 0x4000
	stack_top:

section .text

global hlt
hlt:
	hlt
	jmp hlt

extern checkCompatibility
extern GDT.Code
extern GDT.Pointer
extern bootstrap_cmain
extern bootstrap_loader64

%include "first_page_tables_setup.asmi"
%include "enable_paging.asmi"

section .text
global start32
start32:
	mov esp, stack_top ; Set up stack

	push ebx ; Preserve pointer to multiboot2 structure
	call checkCompatibility
	
	lgdt [GDT.Pointer]

	call bootstrap_cmain

	;~ call setup_page_tables
	;~ call enable_paging
	
	call hlt
	pop ebx ; Pointer to multiboot2 structure
	call bootstrap_loader64 
		
