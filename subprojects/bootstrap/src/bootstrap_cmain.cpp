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

	void printMemMap(terminal::TextTerminal & term, u32 multiboot2_ptr) {
		auto* memMap = multiboot2::findTag<MemoryMap>(multiboot2_ptr);
		requireNotNull(term, memMap);
		term.write("Start, End, Type\n");
		for(u32 i = 0; i < memMap->entriesCount(); i++) {
			auto addr = memMap->entries[i].base_addr;
			term.write(addr, 16);
			term.write(" ");
			term.write(addr + memMap->entries[i].length, 16);
			term.write(" ");
			term.write(memMap->entries[i].type);
			term.write("\n");
		}
	}

    extern "C" void bootstrap_cmain(u32 multiboot2_ptr) {
		terminal::TextTerminal term;
		term.clearScreen();
		printMemMap(term, multiboot2_ptr);
		
		auto* module = multiboot2::findTag<Module>(multiboot2_ptr);
		requireNotNull(term, module);
		term.write(module->addr_start, 16);
		term.write(" ");
		term.write(module->addr_end, 16);
	}
}
