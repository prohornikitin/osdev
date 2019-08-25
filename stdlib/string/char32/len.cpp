#include <string.h>

size_t
str::len(const char32_t* str) {
    size_t i=0;
    while(str[i]!=0) {
        ++i;
    }
    return i;
}