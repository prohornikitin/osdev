OUTPUT(elf32-i386)
ENTRY(start32)


SECTIONS
{
	. = 1M;

	.text : ALIGN(32)
	{
		*(.multiboot_header)
		*(.text)
	}

	.rodata : ALIGN(32)
	{
		*(.rodata)
	}

	.data : ALIGN(32)
	{
		*(.data)
	}

	.bss : ALIGN(32)
	{
		*(.bss)
	}
}
