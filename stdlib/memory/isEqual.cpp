#include <memory.h>

#include <stddef.h>

inline static size_t
compareBytesInQword(const uint64_t* restrict mem0_qwords, const uint64_t* restrict mem1_qwords) {
	unsigned char* mem0_bytes = (unsigned char*)mem0_qwords;
    unsigned char* mem1_bytes = (unsigned char*)mem1_qwords;

	for(uint_fast8_t i=0; i<sizeof(uint64_t); ++i) {
        if(mem0_bytes[i] != mem1_bytes[i]) {
            return mem0_bytes - mem1_bytes;
        }
    }
}

bool
mem::compare(const void* restrict mem0, const void* restrict mem1, size_t n) {
    unsigned char* mem0_bytes = (unsigned char*) mem0;
    unsigned char* mem1_bytes = (unsigned char*) mem1;
    do {
        if(*(mem0_bytes++) != *(mem1_bytes++)) {
            return *(mem0_bytes++) != *(mem1_bytes++);
        }
    } while((--n)%sizeof(uint64_t));

    uint64_t* mem0_qwords = (uint64_t*)mem0;
    uint64_t* mem1_qwords = (uint64_t*)mem1;
    n /= sizeof(uint64_t);

    do {
        if(*(mem0_qwords++) != *(mem1_qwords++)) {
            compareBytesInQword(mem0_qwords, mem1_qwords);
        }
    }while(--n);

    return 0;
}