#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include <interrupts/PIC.h>
#include <graphics/screen_framebuffer.hpp>
#include <graphics/RgbaPixel.h>



extern "C" void testFramebuffer(void* address, uint64_t width, uint64_t height) {
	using namespace screen;
	Vector2<uint16_t> size(width, height);
	VideoFramebuffer<RgbaPixel> framebuffer(address, size);

	Point coordinates;
	for(uint64_t i=100; i<200; ++i) {
		coordinates.y = i;
		for(uint64_t j=300; j<500; ++j) {
			coordinates.x = j;
			framebuffer[coordinates] = 0xFFFFFFFF;
		}
	}
}


extern "C" void kernelMain(void) {
	PIC pic;
	pic.remap(32,40);
	pic.maskAllIRQs();
	pic.disable();
}




