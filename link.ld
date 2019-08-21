ENTRY(start32)

SECTIONS
{
   . = 1M;

   .readWrite : ALIGN(4K)
   {
      *(.multiboot_header)
      *(.data)
   }

   .readOnly : ALIGN(4K)
   {
      *(.text)
		*(.rodata)
   }

   .bss : ALIGN(4K)
   {
		*(.bss)
   }


}
