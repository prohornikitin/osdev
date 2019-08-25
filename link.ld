ENTRY(start32)

SECTIONS
{
   . = 1M;

   .readWrite : ALIGN(32)
   {
      *(.multiboot_header)
      *(.data)
   }

   .readOnly : ALIGN(32)
   {
      *(.text)
		*(.rodata)
   }

   .bss : ALIGN(32)
   {
		*(.bss)
   }


}
