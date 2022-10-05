OUTPUT(elf64-x86-64)
ENTRY(start64)

SECTIONS
{
	. = 0;

	.readOnly :
	{
		*(.multiboot_header)
		*(.text)
		*(.rodata)
	}

	.readWrite :
	{
	  *(.data)
	}

	.bss :
	{
		*(.bss)
	}
}
