#include <string.h>

char16_t*
str::findChar(const char16_t* source, char16_t c) {
    for(size_t i=0; source[i]!=0; ++i) {
        if(source[i] == c) {
            return (char16_t*)(source+i);
        }
    }
    return nullptr;
}