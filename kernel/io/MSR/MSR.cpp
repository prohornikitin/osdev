#include <io/MSR.h>


uint64_t MSR::read(uint32_t MSR) {
	return readMSR(MSR);
}

void MSR::write(uint32_t MSR, uint64_t data) {
	writeMSR(MSR, data);
}


const uint32_t MSR::APIC_base = 0x800;
const uint32_t MSR::APIC_SIV = 0x80F;
