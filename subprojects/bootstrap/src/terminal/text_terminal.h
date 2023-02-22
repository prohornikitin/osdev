#pragma once

#include <stdarg.h>
#include <types.h>

namespace bootstrap {
namespace terminal {

	enum class Color : u8 {
		black = 0,
		blue = 1,
		green = 2,
		cyan = 3,
		red = 4,
		magenta = 5,
		brown = 6,
		light_grey = 7,
		dark_grey = 8,
		light_blue = 9,
		light_green = 10,
		light_cyan = 11,
		light_red = 12,
		light_magenta = 13,
		light_brown = 14,
		white = 15
	};

	class TextTerminal {
	public:
		TextTerminal();
		void restoreState();
		void saveScreenToBuffer();
		void clearScreen();
		void setColor(Color foreground, Color background);
		void putChar(char c);
		void write(const char* str);
		void write(u32 num, int radix = 10);
		void write(u64 num, int radix = 10);

	private:
		static const unsigned width = 80;
		static const unsigned height = 25;
		static const u32 bufferSize = height*width;
		u8 color;
		u8 column;
		u8 row;
		u16 buffer[bufferSize];
		u16* activeTerminal;
    };
}
}
