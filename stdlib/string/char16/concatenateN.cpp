#include <string.h>


void
str::concatenateN(char16_t* destination, const char16_t* source, size_t n) {
    for(size_t i=0; i<n; ++i) {
        destination[len(destination)-1+i] = source[i];
    }
}