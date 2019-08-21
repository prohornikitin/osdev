#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>


extern "C" void printDecimal(unsigned num);

namespace terminal {

    class TextTerminal/* : ITerminal */{
    public:
        TextTerminal();
        void restoreState();
        void saveScreenToBuffer();
        void clearScreen();
        void setColor(unsigned char foreground, unsigned char background);
        void putChar(unsigned char c);
        void write(const char* str);
        void write(unsigned num);
        ~TextTerminal();

    private:
        static const unsigned width = 80;
        static const unsigned height = 25;
        static const size_t bufferSize = height*width;
        uint8_t color;
        uint8_t column;
        uint8_t row;
        uint16_t buffer[bufferSize];
        uint16_t* activeTerminal;
    };


    namespace color {
        extern const uint_fast8_t black;
        extern const uint_fast8_t blue;
        extern const uint_fast8_t green;
        extern const uint_fast8_t cyan;
        extern const uint_fast8_t red;
        extern const uint_fast8_t magenta;
        extern const uint_fast8_t brown;
        extern const uint_fast8_t light_grey;
        extern const uint_fast8_t dark_grey;
        extern const uint_fast8_t light_blue;
        extern const uint_fast8_t light_green;
        extern const uint_fast8_t light_cyan;
        extern const uint_fast8_t light_red;
        extern const uint_fast8_t light_magenta;
        extern const uint_fast8_t light_brown;
        extern const uint_fast8_t white;
    }
}
