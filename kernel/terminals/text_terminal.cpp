#include <terminals/text_terminal.h>

namespace terminal {

    TextTerminal::TextTerminal() :
    color(7),
    row(0),
    column(0),
    activeTerminal(reinterpret_cast<uint16_t*>(0xB8000))
    {}
 

    void TextTerminal::restoreState() {
        for(size_t i=0; i<bufferSize; ++i) {
            activeTerminal[i] = buffer[i];
        }
    }

    void TextTerminal::saveScreenToBuffer() {
        for(size_t i=0; i<bufferSize; ++i) {
            buffer[i] = activeTerminal[i];
        }
    }

    void TextTerminal::clearScreen() {
        for(size_t i=0; i<height*width; ++i) {
            putChar(' ');
        }
    }

    void TextTerminal::setColor(unsigned char text, unsigned char background) {
        color = text | background << 4;
    }

    void TextTerminal::putChar(unsigned char c) {
    	switch(c) {
    	case '\r':
    		column = 0;
    		break;
    	case '\n':
    		column = 0;
            ++row;
            if (row == height) {
                row = 0;
            }
            break;
        case '\t':
        	column+=4;
        	break;
        case '\v':
        	++row;
        	break;
        case '\a':
        	//TODO: beep;
        	break;
    	default:
        	const size_t index = row * width + column;
        	activeTerminal[index] = ((uint16_t)c | (uint16_t)color << 8);
        	++column;
    	}
    	if (column == width) {
            	column = 0;
            	++row;
	            if (row == height) {
	                row = 0;
	        }
	    }
    }

    void TextTerminal::write(const char* str) {
        for(size_t i=0; str[i]!=0; ++i) {
            putChar(str[i]);
        }
    }

    void TextTerminal::write(unsigned num) {
        printDecimal(num);
    }

    TextTerminal::~TextTerminal() {
        
    }

    namespace color {
        const uint_fast8_t black = 0;
        const uint_fast8_t blue = 1;
        const uint_fast8_t green = 2;
        const uint_fast8_t cyan = 3;
        const uint_fast8_t red = 4;
        const uint_fast8_t magenta = 5;
        const uint_fast8_t brown = 6;
        const uint_fast8_t light_grey = 7;
        const uint_fast8_t dark_grey = 8;
        const uint_fast8_t light_blue = 9;
        const uint_fast8_t light_green = 10;
        const uint_fast8_t light_cyan = 11;
        const uint_fast8_t light_red = 12;
        const uint_fast8_t light_magenta = 13;
        const uint_fast8_t light_brown = 14;
        const uint_fast8_t white = 15;
    }




}
