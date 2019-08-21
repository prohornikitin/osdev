#include <string.hpp>

void 
str::concatenate(char16_t* destination, const char16_t* source) {
    for(size_t i=0; destination[i]!=0; ++i) {
        destination[len(destination)-1+i] = source[i];
    }
}

