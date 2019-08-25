#include <string.h>

void
str::copy(char16_t* destination, const char16_t* source) {
    size_t i;
    for(i=0; source[i]!=0; ++i) {
        destination[i] = source[i];
    }
    destination[i] = 0;
}