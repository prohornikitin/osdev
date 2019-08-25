#pragma once

#include <cstdint>


namespace screen
{	

	struct RgbaPixel
	{
		uint32_t operator=(uint32_t color);
		RgbaPixel(uint32_t color);

		uint8_t blue;
		uint8_t green;
		uint8_t red;
		uint8_t reserved;

	}__attribute__((packed));
}