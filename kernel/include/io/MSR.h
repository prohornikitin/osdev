#pragma once

#include <stdint.h>

extern "C" uint64_t readMSR(uint32_t MSR);
extern "C" void writeMSR(uint32_t MSR, uint64_t data);

namespace MSR {
	uint64_t read(uint32_t MSR);
	void write(uint32_t MSR, uint64_t data);

	extern const uint32_t APIC_base;
	extern const uint32_t APIC_SIV;
	//extern const uint32_t APIC_;
}