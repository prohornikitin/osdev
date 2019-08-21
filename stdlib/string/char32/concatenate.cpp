#include <string.hpp>

void 
str::concatenate(char32_t* destination, const char32_t* source) {
    for(size_t i=0; destination[i]!=0; ++i) {
        destination[len(destination)-1+i] = source[i];
    }
}

