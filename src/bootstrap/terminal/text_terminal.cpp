#include <terminal/text_terminal.h>
#include <types.h>

namespace bootstrap {
namespace terminal {

    TextTerminal::TextTerminal() :
    color(7),
    column(0),
    row(0),
    activeTerminal(reinterpret_cast<u16*>(0xB8000))
    {}
 

    void TextTerminal::restoreState() {
        for(usize i=0; i<bufferSize; ++i) {
            activeTerminal[i] = buffer[i];
        }
    }

    void TextTerminal::saveScreenToBuffer() {
        for(usize i=0; i<bufferSize; ++i) {
            buffer[i] = activeTerminal[i];
        }
    }

    void TextTerminal::clearScreen() {
        column = 0;
        row = 0;
        for(usize i=0; i<height*width; ++i) {
            putChar(' ');
        }
    }

    void TextTerminal::setColor(Color text, Color background) {
        color = (uint8_t)text | (uint8_t)background << 4;
    }

    void TextTerminal::putChar(char c) {
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
        	//TODO: beep
        	break;
    	default:
        	const usize index = row * width + column;
        	activeTerminal[index] = (c | (u16)color << 8);
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
        for(usize i=0; str[i]!=0; ++i) {
            putChar(str[i]);
        }
    }

    void TextTerminal::write(u32 num, int radix) {
        char buff[20];
        usize i = 0;
        do {
            buff[i] = num % radix;
            num /= radix;
            i++;
        } while(num != 0);
        while(i != 0) {
            i--;
            putChar(buff[i] + '0');
        }
    }
}
}
