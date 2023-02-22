#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>


namespace terminal {

    enum class Color : uint8_t {
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
            void putChar(unsigned char c);
            void write(const char* str);
            void write(uint64_t num, int radix = 10);

        private:
            static const unsigned width = 80;
            static const unsigned height = 25;
            static const size_t bufferSize = height*width;
            uint8_t color;
            uint8_t column;
            uint8_t row;
            uint16_t buffer[bufferSize];
            uint16_t* const activeTerminal;
    };
}
