#pragma once

#include <stdarg.h>
#include <stddef.h>


namespace terminal {
	class ITerminal {
		public:
			virtual void restoreState();
            virtual void saveScreenToBuffer();
			virtual void clearScreen();
			virtual void putChar(unsigned char c);
			virtual void write(const char* str);
			//virtual void writeFormatted(String<> format, va_list va_args);
            virtual void setColor(unsigned char foreground, unsigned char background) = 0;
			virtual ~ITerminal() {}
	};
};