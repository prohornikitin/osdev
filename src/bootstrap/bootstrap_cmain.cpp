#include <multiboot2.h>
#include <types.h>
#include <terminal/text_terminal.h>

extern "C" void hlt();


#define requireNotNull(term, var) \
	if(var == nullptr) { \
		term.write("[Error at "); \
		term.write(__FILE__); \
		term.write(":"); \
		term.write((u32)__LINE__); \
		term.write("] "); \
		term.write(#var); \
		term.write(" == nullptr"); \
		hlt(); \
	}

namespace bootstrap {
    using multiboot2::MemoryMap;
    using multiboot2::Module;

    extern "C" void bootstrap_cmain(u32 multiboot2_ptr) {
		terminal::TextTerminal term;
		term.clearScreen();
		auto* module = multiboot2::findTag<Module>(multiboot2_ptr);
		auto* memMap = multiboot2::findTag<MemoryMap>(multiboot2_ptr);
		requireNotNull(term, module);
		requireNotNull(term, memMap);
		for(u32 i = 0; i < memMap->entriesCount(); i++) {
			term.write(memMap->entries[i].base_addr, 16);
			term.write(" ");
			term.write(memMap->entries[i].length, 16);
			term.write(" ");
			term.write(memMap->entries[i].type);
			term.write("\n");
		}
		term.write(module->addr_start, 16);
		term.write(" ");
		term.write(module->addr_end, 16);
	}
}
