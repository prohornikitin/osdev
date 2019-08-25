#include <graphics/RgbaPixel.h>

namespace screen
{
	uint32_t RgbaPixel::operator=(uint32_t color) {
		*this = (RgbaPixel)color;
		return color;
	}

	RgbaPixel::RgbaPixel(uint32_t color) {
		 this->red = color & 0xFF; //first byte
		 this->green = (color >> 8) & 0xFF; //second byte
		 this->blue = (color >> 16) & 0xFF; //third byte
		 this->reserved = (color >> 24) & 0xFF; //fourth byte
	}
}
