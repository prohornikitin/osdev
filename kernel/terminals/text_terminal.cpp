#include <terminals/text_terminal.h>

namespace terminal {

    TextTerminal::TextTerminal() :
    color(7),
    column(0),
    row(0),
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

    void TextTerminal::setColor(Color text, Color background) {
        color = (uint8_t)text | (uint8_t)background << 4;
    }

    constexpr void TextTerminal::putChar(unsigned char c) {
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


}
