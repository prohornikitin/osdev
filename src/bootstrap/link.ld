OUTPUT(elf32-i386)
ENTRY(start32)


SECTIONS
{
	. = 1M;

	.readOnly : ALIGN(32)
	{
		*(.multiboot_header)
		*(.text)
		*(.rodata)
	}

	.readWrite : ALIGN(32)
	{
	  *(.data)
	}

	.bss : ALIGN(32)
	{
		*(.bss)
	}
}
