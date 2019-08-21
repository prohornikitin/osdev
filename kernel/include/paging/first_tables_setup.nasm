L4_table equ 0x80000
first_L3_table equ L4_table+0x1000
first_L2_table equ first_L3_table+0x1000
first_L1_table equ first_L2_table+0x1000

setup_page_tables:
    push edi
    push ebx
	call clear_page_tables
	call map_first_2MB
    pop ebx
    pop edi


map_first_2MB:
	mov edi, L4_table
    mov DWORD [edi], first_L3_table | 11b ; WRITABLE and PRESENT flags
    mov edi, first_L3_table
    mov DWORD [edi], first_L2_table | 11b ; WRITABLE and PRESENT flags
    mov edi, first_L2_table
    mov DWORD [edi], first_L1_table | 11b ; WRITABLE and PRESENT flags
    mov edi, first_L1_table

    mov ebx, 11b  ; WRITABLE and PRESENT flags (2 first bits)
    mov ecx, 512
 	
	.set_L1_table_entry:
	    mov DWORD [edi], ebx         
	    add ebx, 0x1000              
	    add edi, 8               
	    loop .set_L1_table_entry
	    ret


clear_page_tables:
	mov edi, L4_table
    mov cr3, edi
    xor eax, eax
    mov ecx, 4096
    rep stosd          ; Clear the memory.
    ret
