#include "memory.hpp"

void*
mem::reallocate(void* mem, size_t newSize) {
	//TODO: kernel optimization
	void* newMem = allocate(newSize);
	mem::copy(newMem, mem, sizeof(mem));
	free(mem);
	return newMem;
}
