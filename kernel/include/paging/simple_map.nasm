extern first_L2_table

map_2MB:
    mov edx, edi

    mov edi, first_L2_table
    mov DWORD [edi], first_L1_table | 11b ; WRITABLE and PRESENT flags
    mov edi, first_L1_table

    or edx, 11b  ; WRITABLE and PRESENT flags (2 first bits)
    mov ecx, 512
 	
	.set_L1_table_entry:
	    mov DWORD [edi], edx
	    add edx, 0x1000              
	    add edi, 8               
	    loop .set_L1_table_entry
	    ret

