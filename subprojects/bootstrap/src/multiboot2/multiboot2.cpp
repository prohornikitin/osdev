#include <terminal/text_terminal.h>
#include <types.h>
#include <multiboot2.h>

namespace bootstrap {
namespace multiboot2 {

	u32 MemoryMap::entriesCount() const {
		u32 entriesSize = size - sizeof(type) - sizeof(size) - 
			sizeof(entry_size) - sizeof(entry_version);
		return entriesSize / entry_size;
	}

} //multiboot2
} //bootstrap
