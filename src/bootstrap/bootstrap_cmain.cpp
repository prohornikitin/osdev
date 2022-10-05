#include <multiboot2.h>
#include <types.h>
#include <terminal/text_terminal.h>


namespace bootstrap {
    using multiboot2::MemoryMap;
    using multiboot2::Module;

    extern "C" void bootstrap_cmain(usize multiboot2_ptr) {
		terminal::TextTerminal term;
		term.clearScreen();
		Module* tag = multiboot2::findTag<Module>(multiboot2_ptr);
		term.write(tag->addr_start);
		term.write("\n");
		//~ auto* tag = multiboot2::findTag<MemoryMap>(multiboot2_ptr);
		
		//~ term.clearScreen();
		//~ if(tag != nullptr) {
			//~ usize num = (tag->size - 4*sizeof(u32)) / tag->entry_size;
			//~ for(usize i = 0; i < num; i++) {
				//~ term.write(tag->entries[i].base_addr);
				//~ term.write(" ");
				//~ term.write(tag->entries[i].length);
				//~ term.write(" ");
				//~ term.write(tag->entries[i].type);
				//~ term.write("\n");
			//~ }
		//~ } else {
			//~ term.write("nullptr");
		//~ }
	}
}
