#include <memory.h>

#include <stddef.h>

void*
mem::find(const void* restrict source, unsigned char c, size_t n) {
    unsigned char* source_bytes = (unsigned char*)source;
    for (size_t i=0; n>0; --n,++i) {
        if (source_bytes[i] == c) {
        	return (void*) &source_bytes[i];
        }
    }
    return nullptr;
}