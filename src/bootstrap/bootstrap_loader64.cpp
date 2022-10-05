#include <multiboot2.h>
#include <types.h>
#include <terminal/text_terminal.h>

namespace bootstrap {

    extern "C" void bootstrap_loader64(usize multiboot2_ptr) {
		terminal::TextTerminal term;
		term.write("TODO bootstrap_loader64()");
		//~ auto* tag = multiboot2::findTag<MemoryMap>(multiboot2_ptr, 6);
		//~ terminal::TextTerminal term;
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
