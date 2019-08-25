#pragma once

#include <stddef.h>
#include <stdint.h>


#define restrict __restrict

namespace mem {
    void set(void* restrict mem, unsigned char value, size_t sizeInBytes);
    void* find(const void* restrict source, unsigned char c, size_t sizeInBytes);
    bool isEqual(const void* restrict mem0, const void* restrict mem1, size_t n);
    size_t compare(const void* restrict mem0, const void* restrict mem1, size_t n);
    extern void copy(void* restrict destination, void* restrict source, size_t n);
    extern void copyBackward(void* destination, void* source, size_t bytesNum);
    extern void safeMove(void* destination, void* source, size_t n);

    #ifndef KERNEL
    	void* allocate(size_t size);
    	void free(void* mem);
    	void* reallocate(void* mem, size_t newSize);
    #endif
}
