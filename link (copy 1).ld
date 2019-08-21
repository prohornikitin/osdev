ENTRY(start32)

SECTIONS
{
   . = 1M;

   .boot :
   {
      *(.multiboot_header)
   }

   .readWrite :
   {
      *(.data)
   }

   .readOnly :
   {
      *(.text)
		*(.rodata)
   }

   .bss :
   {
		*(.bss)
   }


}
