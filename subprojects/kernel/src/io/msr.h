#pragma once
#include <stdint.h>

namespace msr {
	void read(uint32_t msr, uint32_t* lo, uint32_t* hi);
	void write(uint32_t msr, uint32_t lo, uint32_t hi);
	uint64_t read(uint32_t msr);
	void write(uint32_t msr, uint64_t data);
}