#include <string.hpp>

void
str::concatenateN(char32_t* destination, const char32_t* source, size_t n) {
    for(size_t i=0; i<n; ++i) {
        destination[len(destination)-1+i] = source[i];
    }
}