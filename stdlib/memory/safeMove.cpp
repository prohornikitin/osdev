#include <memory.h>

void mem::safeMove(void* destination, void* source, size_t bytesNum) {
	if(destination < source) {
		mem::copy(destination, source, bytesNum);
		return;
	}
	mem::copyBackward(destination, source, bytesNum);
}