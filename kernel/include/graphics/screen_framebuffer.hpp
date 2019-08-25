#pragma once

#include <cstdint>
#include <initializer_list>
#include <Vector2.h>


#include <cstdint>


namespace screen {

	struct Point {
		uint16_t x;
		uint16_t y;
	};

	template <class Pixel>
	struct VideoFramebuffer
	{
	public:
		VideoFramebuffer(void* address, Vector2<uint16_t> size)
	 	: size(size), 
	 	  pixels((Pixel*)address) {}

		Pixel& operator[](Point point) {
 			return pixels[point.y * size.x + point.x];
 		}

		//void drawLine(Point<uint16_t> start, Point<uint16_t> end);
		//extern drawRectangle(RgbFramebuffer rgbFramebuffer, Rectabgle);
	private:
		Vector2<uint16_t> size;
		Pixel* pixels;
	};


	


};