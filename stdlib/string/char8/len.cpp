#include <string.h>

size_t
str::len(const char* str) {
    size_t i=0;
    while(str[i]!=0) {
        ++i;
    }
    return i;
}