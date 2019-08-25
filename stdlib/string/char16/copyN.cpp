#include <string.h>

void
str::copyN(char16_t* destination, const char16_t* source, size_t n) {
    for(size_t i=0; i<n; ++i) {
        destination[i] = source[i];
    }
}