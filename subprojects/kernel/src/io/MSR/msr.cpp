#include <stdint.h>

namespace msr {
	void read(uint32_t msr, uint32_t* lo, uint32_t* hi) {
		asm("rdmsr" : "=a"(*lo), "=d"(*hi) : "c"(msr));
	}

	void write(uint32_t msr, uint32_t lo, uint32_t hi) {
		asm("wrmsr" : : "a"(lo), "d"(hi), "c"(msr));
	}


	uint64_t read(uint32_t msr) {
		uint32_t lo, hi;
		read(msr, &lo, &hi);
		uint64_t data = ((uint64_t)hi >> 32) | lo;
		return data;
	}

	void write(uint32_t msr, uint64_t data) {
		uint32_t lo = data & 0xFFFFFFFF;
		uint32_t hi = data >> 32;
		write(msr, lo, hi);
	}
}